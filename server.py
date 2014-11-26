#!/usr/bin/env python
# coding:utf-8

import tornado.web
import os
import markdown2
import torndb
import time
import tool

from tornado.options import define, options
from tool import BriefParser, cut

# if "SERVER_SOFTWARE" in os.environ:
#     from sae.const import (MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASS, MYSQL_DB)
#
# 	DEBUG = False
# else:
MYSQL_HOST = "localhost"
MYSQL_PORT = 3306
MYSQL_USER = "root"
MYSQL_PASS = ""
MYSQL_DB = "14px"
DEBUG = True
import tornado.ioloop

DB = torndb.Connection(
    '%s:%s' % (MYSQL_HOST, str(MYSQL_PORT)),
    MYSQL_DB,
    MYSQL_USER,
    MYSQL_PASS,
    max_idle_time=5,
    connect_timeout=5,
)

define('username', default='14px')
define('password', default='britten')
define('plimit', default=10)
define('toplimit', default=10)


class BaseHandler(tornado.web.RequestHandler):
	def get_current_user(self):
		return self.get_secure_cookie('user')


class IndexHandler(BaseHandler):
	def get(self, p):
		sql = 'SELECT * FROM Article ORDER BY id DESC LIMIT %s, %s'
		sql2 = 'SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id'
		sql3 = "SELECT COUNT(*) AS count FROM Article"
		sql4 = "SELECT * FROM Article ORDER BY click DESC LIMIT 0, %s"

		count = DB.query(sql3)[0]["count"]
		last = count / options.plimit if count % options.plimit == 0 else count / options.plimit + 1
		p = p if p else 1

		if 1 <= p <= last:
			offset = p - 1
		else:
			offset = 0

		paging = dict(
			pre=None if p - 1 <= 0 else p - 1,
			next=None if p + 1 > last else p + 1,
			first=1,
			last=last,
			current=p,
		)

		articles = DB.query(sql, offset * options.plimit, options.plimit)
		for a in articles:
			a["tags"] = DB.query(sql2, a["id"])

		tops = DB.query(sql4, options.toplimit)
		data = dict(
			articles=articles,
			paging=paging,
			cut=cut,
			tops=tops,
		)
		self.render("index.html", **data)


class AuthHandler(BaseHandler):
	def post(self):
		username = self.get_argument("username", "").strip()
		password = self.get_argument("password", "").strip()
		if username == options.username and password == options.password:
			self.set_secure_cookie("user", username)
		self.redirect("/")

	def get(self):
		self.clear_cookie("user")
		self.redirect("/")


class ArticleHandler(BaseHandler):
	@tornado.web.authenticated
	def post(self):
		title = self.get_argument("title")
		tag = self.get_argument("tag")
		content = self.get_argument("editor")
		cover = self.get_argument("cover")
		_content = markdown2.Markdown().convert(content)
		_tags = sorted(filter(lambda x: len(x), map(lambda x: x.strip(), list(set(tag.split("#"))))))
		_tags = [(x, time.strftime("%Y-%m-%d %H:%M:%S")) for x in _tags]

		p = BriefParser(140)
		p.feed(_content)

		sql = "INSERT INTO Article(title, content, brief, cover, time) VALUES(%s, %s, %s, %s, %s)"
		sql2 = "INSERT INTO Tag(tagname, createtime) VALUES(%s, %s)"
		sql3 = "INSERT INTO Article_Tag(article_id, tag_id) VALUES(%s, %s)"

		try:
			aid = DB.insert(sql, title, content, p.output(), cover, time.strftime("%Y-%m-%d %H:%M:%S"))
			tid = DB.insertmany(sql2, _tags)
			article_tags = [(aid, x) for x in range(tid - len(_tags) + 1, tid + 1)]
			DB.insertmany(sql3, article_tags)
		except Exception, e:
			print e

		self.redirect("/")

	def get(self, id):
		sql = "SELECT * FROM Article WHERE id=%s"
		sql2 = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"
		sql3 = "UPDATE Article SET click=click+1 WHERE id=%s"
		sql4 = "SELECT * FROM Comment WHERE article_id=%s"
		sql5 = "SELECT * FROM Guest WHERE id=%s"

		try:
			DB.update(sql3, id)
			article = DB.query(sql, id)[0]
			article["tags"] = DB.query(sql2, article["id"])
			comments = DB.query(sql4, id)
			for comment in comments:
				comment["guest"] = DB.query(sql5, comment["guest_id"])[0]
				if comment["ref"]:
					comment["ref"] = DB.query(sql5, comment["ref"])[0]
			self.render("article.html", article=article, comments=comments, mdparse=tool.mdparse)
		except Exception, e:
			print e
			self.redirect("/")


class EditorHandler(BaseHandler):
	@tornado.web.authenticated
	def get(self):
		self.render("editor.html")

	def post(self):
		content = self.get_argument("editor", "")
		md = markdown2.Markdown()

		self.write(md.convert(content))


class TagHandler(BaseHandler):
	def get(self, t, p):
		sql = "SELECT a.* FROM Article AS a, Tag AS t, Article_Tag AS at WHERE t.tagname=%s AND t.id=at.tag_id AND a.id=at.article_id LIMIT %s, %s"
		sql2 = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"
		sql3 = "SELECT COUNT(*) AS count FROM Article AS a, Tag AS t, Article_Tag AS at WHERE t.tagname=%s AND t.id=at.tag_id AND a.id=at.article_id"

		try:
			count = DB.query(sql3, t)[0]["count"]
			last = count / options.plimit if count % options.plimit == 0 else count / options.plimit + 1
			p = int(p) if (p and 1 <= int(p) <= last) else 1
			if 1 <= p <= last:
				offset = p - 1
			else:
				offset = 0
			paging = dict(
				pre=None if p - 1 <= 0 else p - 1,
				next=None if p + 1 > last else p + 1,
				first=1,
				last=last,
				current=p,
			)
			articles = DB.query(sql, t, offset * options.plimit, options.plimit)
			for article in articles:
				article["tags"] = DB.query(sql2, article["id"])
			self.render("index.html", articles=articles, paging=paging)
		except Exception, e:
			self.redirect("/")


class CommentHandler(BaseHandler):
	def post(self, aid):
		sql = "INSERT INTO Guest(guestname, email, homepage) VALUES(%s, %s, %s)"
		sql2 = "INSERT INTO Comment(article_id, guest_id, content, time, ref) VALUES(%s, %s, %s, %s, %s)"
		try:
			guestname = self.get_argument("guestname")
			if guestname.strip() == "14px" and not self.get_current_user():
				raise Exception("not 14px")
			email = self.get_argument("email")
			homepage = self.get_argument("homepage", None)
			ref = self.get_argument("ref", None)
			content = self.get_argument("content")
			guestid = DB.insert(sql, guestname, email, homepage)
			DB.insert(sql2, aid, guestid, content, tool.gen_time(), ref)
			self.redirect("/article/%s#comment-%s" % (aid, guestid))
		except Exception, e:
			self.redirect("/article/%s" % aid)

	@tornado.web.authenticated
	def get(self, aid, cid):
		sql = "DELETE FROM Comment WHERE id=%s"
		try:
			DB.update(sql, cid)
		except Exception, e:
			pass
		finally:
			self.redirect("/article/%s" % aid)


URLS = [
	(r"^/(\d*)$", IndexHandler),
	(r"^/auth/$", AuthHandler),
	(r"^/editor/$", EditorHandler),
	(r"^/article/(\d+)$", ArticleHandler),
	(r"^/tag/(.+)/(\d*)$", TagHandler),
	(r"^/article/(\d+)/comment/$", CommentHandler),
	(r"^/article/(\d+)/comment/(\d+)/$", CommentHandler),
]

SETTINGS = dict(
    template_path=os.path.join(os.path.dirname(__file__), "template"),
    static_path=os.path.join(os.path.dirname(__file__), "static"),
    debug=True,
    cookie_secret="61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
    login_url="/",
)

application = tornado.web.Application(URLS, **SETTINGS)

if __name__ == "__main__":
	application.listen(8888)
	tornado.ioloop.IOLoop.instance().start()
