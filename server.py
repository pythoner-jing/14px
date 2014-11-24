#!/usr/bin/env python
#coding:utf-8

import tornado.web
import os
import markdown2
import torndb
import time

from tornado.options import define, options
from tool import BriefParser

if "SERVER_SOFTWARE" in os.environ:
	from sae.const import (MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASS, MYSQL_DB)
	DEBUG = False
else:
	MYSQL_HOST = "localhost"
	MYSQL_PORT = 3306
	MYSQL_USER = "root"
	MYSQL_PASS = ""
	MYSQL_DB = "14px"
	DEBUG = True
	import tornado.ioloop

DB = torndb.Connection(
	"%s:%s" % (MYSQL_HOST, str(MYSQL_PORT)),
	MYSQL_DB,
	MYSQL_USER,
	MYSQL_PASS,
	max_idle_time = 5,
	connect_timeout = 5,
)

define("username", default="14px")
define("password", default="britten")
define("plimit", default=3)

class BaseHandler(tornado.web.RequestHandler):
	def get_current_user(self):
		return self.get_secure_cookie("user")

class IndexHandler(BaseHandler):
	def get(self):
		sql = "SELECT * FROM Article ORDER BY id DESC LIMIT 0, %s"
		sql2 = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"
		sql3 = "SELECT COUNT(*) FROM Article"

		articles = DB.query(sql, options.plimit)
		for a in articles:
			a["tags"] = DB.query(sql2, a["id"])

		count = DB.query(sql3)

		paging = dict(
			has_pre = False,
			has_next = count > options.plimit,
		)

		self.render("index.html", articles = articles, paging)

class PageHandler(BaseHandler):
	def get(self, p):
		sql = "SELECT * FROM Article ORDER BY id DESC LIMIT %s, %s"
		sql2 = "SELECT COUNT(*) FROM Article"
		sql3 = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"

		count = DB.query(sql2)

		p = int(p)
		if 1 <= p <= count:
			offset = p - 1
		else:
			offset = 0

		print offset
		articles = DB.query(sql, offset * options.plimit, options.plimit)
		for a in articles:
			a["tags"] = DB.query(sql3, a["id"])

		self.render("index.html", articles = articles)

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
		pass

class EditorHandler(BaseHandler):
	@tornado.web.authenticated
	def get(self):
		self.render("editor.html")

	def post(self):
		content = self.get_argument("editor", "")
		md = markdown2.Markdown()

		self.write(md.convert(content))

URLS = [
	(r"^/$", IndexHandler),
	(r"^/auth$", AuthHandler),
	(r"^/editor$", EditorHandler),
	(r"^/article$", ArticleHandler),
	(r"^/page/(\d+)$", PageHandler),
]

SETTINGS = dict(
	template_path = os.path.join(os.path.dirname(__file__), "template"),
	static_path = os.path.join(os.path.dirname(__file__), "static"),
	debug = True,
	cookie_secret = "61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
	login_url = "/",
)

application = tornado.web.Application(URLS, **SETTINGS)

if __name__ == "__main__":
    application.listen(8888)
    tornado.ioloop.IOLoop.instance().start() 
