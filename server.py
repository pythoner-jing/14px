#!/usr/bin/env python
# coding:utf-8

import tornado.web
import markdown2
import time
import tool
import module

from db import *
from tornado.options import define, options
from tool import BriefParser, cut


define('username', default='')
define('password', default='')
define('plimit', default=10)
define('toplimit', default=10)
define('climit', default=10)


class BaseHandler(tornado.web.RequestHandler):
    def get_current_user(self):
        return self.get_secure_cookie('user')

    def get_error_html(self, status_code, **kwargs):
        if status_code == 404:
            return self.render_string("404.html")
        else:
            tornado.web.RequestHandler.get_error_html(self, status_code, **kwargs)


class IndexHandler(BaseHandler):
    def get(self, p):
        sql = "SELECT * FROM Article ORDER BY id DESC LIMIT %s, %s"
        sql2 = "SELECT COUNT(*) AS count FROM Article"
        sql3 = "SELECT * FROM Article ORDER BY click DESC LIMIT 0, %s"
        sql4 = "SELECT * FROM Comment ORDER BY id DESC LIMIT 0, %s"

        count = DB.get(sql2)["count"]

        paging, offset = tool.paging(p, count, options.plimit)

        articles = DB.query(sql, offset * options.plimit, options.plimit)
        comments = DB.query(sql4, options.climit)
        tops = DB.query(sql3, options.toplimit)

        data = dict(
            articles=articles,
            paging=paging,
            cut=cut,
            tops=tops,
            comments=comments,
        )
        self.render("index.html", **data)


class AuthHandler(BaseHandler):
    def post(self):
        username = self.get_argument("username", "")
        password = self.get_argument("password", "")
        if username == options.username and password == options.password:
            self.set_secure_cookie("user", username)
        self.redirect("/")

    def get(self):
        self.clear_cookie("user")
        self.redirect("/")


class ArticleHandler(BaseHandler):
    @tool.restful
    @tornado.web.authenticated
    def post(self, *args):
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
            print self, e

        self.redirect("/")

    def get(self, id):
        sql = "SELECT * FROM Article WHERE id=%s"
        sql2 = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"
        sql3 = "UPDATE Article SET click=click+1 WHERE id=%s"
        sql4 = "SELECT * FROM Comment WHERE article_id=%s"

        try:
            DB.update(sql3, id)
            article = DB.get(sql, id)
            article["tags"] = DB.query(sql2, article["id"])
            comments = DB.query(sql4, id)
            data = dict(
                article=article,
                comments=comments,
                mdparse=tool.mdparse,
                guestname=self.get_secure_cookie("guestname"),
                homepage=self.get_secure_cookie("homepage"),
                email=self.get_secure_cookie("email"),
                care_none=tool.care_none,
            )
            self.render("article.html", **data)
        except Exception, e:
            print self, e
            self.redirect("/")

    @tornado.web.authenticated
    def put(self, *args):
        id = args[0]
        sql = "INSERT INTO Article(title, content, brief, cover, time) VALUES(%s, %s, %s, %s, %s)"
        sql2 = "INSERT INTO Tag(tagname, createtime) VALUES(%s, %s)"
        sql3 = "INSERT INTO Article_Tag(article_id, tag_id) VALUES(%s, %s)"
        sql4 = "UPDATE Article SET title=%s, content=%s, brief=%s, cover=%s, time=%s WHERE id=%s"
        sql5 = "DELETE FROM Tag WHERE id IN (SELECT at.tag_id FROM Article AS a, Article_Tag AS at WHERE a.id=%s AND a.id=at.article_id)"
        try:
            DB.update(sql5, id)

            title = self.get_argument("title")
            tag = self.get_argument("tag")
            content = self.get_argument("editor")
            cover = self.get_argument("cover")
            _content = markdown2.Markdown().convert(content)
            _tags = sorted(filter(lambda x: len(x), map(lambda x: x.strip(), list(set(tag.split("#"))))))
            _tags = [(x, time.strftime("%Y-%m-%d %H:%M:%S")) for x in _tags]

            p = BriefParser(140)
            p.feed(_content)

            DB.update(sql4, title, content, p.output(), cover, time.strftime("%Y-%m-%d %H:%M:%S"), id)
            tid = DB.insertmany(sql2, _tags)
            article_tags = [(id, x) for x in range(tid - len(_tags) + 1, tid + 1)]
            DB.insertmany(sql3, article_tags)
        except Exception, e:
            print self, e
        self.redirect("/")

    @tornado.web.authenticated
    def delete(self, id):
        sql = "DELETE FROM Article WHERE id=%s"
        try:
            DB.update(sql, id)
        except Exception, e:
            print self, e
        finally:
            self.redirect("/")


class EditorHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self, id):
        sql = "SELECT * FROM Article WHERE id=%s"
        sql2 = "SELECT tagname FROM Article_Tag AS at, Tag AS t WHERE at.article_id=%s AND at.tag_id=t.id"
        if id:
            article = DB.get(sql, id)
            tags = DB.query(sql2, id)
            tags = "#".join(map(lambda x: x["tagname"].encode("utf-8"), tags))
        else:
            article = {"title": "", "id": "", "content": "", "cover": ""}
            tags = ""
        data = dict(
            article=article,
            tags=tags,
        )
        self.render("editor.html", **data)

    @tool.restful
    def post(self, *args):
        content = self.get_argument("editor", "")
        md = markdown2.Markdown()

        self.write(md.convert(content))


class TagHandler(BaseHandler):
    def get(self, t, p):
        sql = "SELECT a.* FROM Article AS a, Tag AS t, Article_Tag AS at WHERE t.tagname=%s AND t.id=at.tag_id AND a.id=at.article_id LIMIT %s, %s"
        sql2 = "SELECT COUNT(*) AS count FROM Article AS a, Tag AS t, Article_Tag AS at WHERE t.tagname=%s AND t.id=at.tag_id AND a.id=at.article_id"
        sql3 = "SELECT * FROM Article ORDER BY click DESC LIMIT 0, %s"
        sql4 = "SELECT * FROM Comment ORDER BY id DESC LIMIT 0, %s"

        try:
            count = DB.get(sql2, t)["count"]
            paging, offset = tool.paging(p, count, options.plimit)
            articles = DB.query(sql, t, offset * options.plimit, options.plimit)
            comments = DB.query(sql4, options.climit)
            tops = DB.query(sql3, options.toplimit)
            data = dict(
                articles=articles,
                paging=paging,
                cut=tool.cut,
                tops=tops,
                comments=comments,
            )
            self.render("index.html", **data)
        except Exception, e:
            print self, e
            self.redirect("/")


class CommentHandler(BaseHandler):
    @tool.restful
    def post(self, *args):
        aid = args[0]
        sql = "INSERT INTO Guest(guestname, email, homepage) VALUES(%s, %s, %s)"
        sql2 = "INSERT INTO Comment(article_id, guest_id, content, time, ref) VALUES(%s, %s, %s, %s, %s)"
        try:
            guestname = self.get_argument("guestname")
            if guestname == "14px" and not self.get_current_user():
                raise Exception("not 14px")
            email = self.get_argument("email")
            homepage = self.get_argument("homepage", "")
            ref = self.get_argument("ref", None)
            content = self.get_argument("content")
            guestid = DB.insert(sql, guestname, email, homepage)
            DB.insert(sql2, aid, guestid, content, tool.gen_time(), ref)
            self.set_secure_cookie("guestname", guestname)
            self.set_secure_cookie("email", email)
            self.set_secure_cookie("homepage", homepage)
            self.redirect("/article/%s#comment-%s" % (aid, guestid))
        except Exception, e:
            print self, e
            self.redirect("/article/%s" % aid)

    @tornado.web.authenticated
    def delete(self, aid, cid):
        sql = "DELETE FROM Comment WHERE id=%s"
        try:
            DB.update(sql, cid)
        except Exception, e:
            pass
        finally:
            self.redirect("/article/%s#top" % aid)


class LinkEditorHandler(BaseHandler):
    def get(self):
        sql = "SELECT content FROM LinkContent"
        try:
            content = DB.query(sql)[-1]["content"]
        except Exception, e:
            print self, e
            content = ""
        self.render("linkeditor.html", content=content)

    def post(self):
        sql = "INSERT INTO LinkContent(content) VALUES(%s)"
        sql2 = "INSERT INTO Link(title, address) VALUES(%s, %s)"
        sql3 = "DELETE FROM Link"
        content = self.get_argument("editor")
        _content = markdown2.Markdown().convert(content)
        try:
            p = tool.LinkParser()
            p.feed(_content)
            links = p.output()
            DB.insert(sql, content)
            DB.update(sql3)
            DB.insertmany(sql2, links)
        except Exception, e:
            print self, e

        self.redirect("/")


class NotFoundHandler(BaseHandler):
    def get(self):
        self.render("404.html")


URLS = [
    (r"^/(\d*)$", IndexHandler),
    (r"^/auth/$", AuthHandler),
    (r"^/editor/(\d*)$", EditorHandler),
    (r"^/linkeditor/$", LinkEditorHandler),
    (r"^/article/$", ArticleHandler),
    (r"^/article/(\d+)$", ArticleHandler),
    (r"^/tag/(.+)/(\d*)$", TagHandler),
    (r"^/article/(\d+)/comment/$", CommentHandler),
    (r"^/article/(\d+)/comment/(\d+)/$", CommentHandler),
    (r".*", NotFoundHandler),
]

SETTINGS = dict(
    template_path=os.path.join(os.path.dirname(__file__), "template"),
    static_path=os.path.join(os.path.dirname(__file__), "static"),
    debug=DEBUG,
    cookie_secret="61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
    login_url="/",
    autoescape=None,
    ui_modules={
        "RecentComment": module.RecentCommentModule,
        "Brief": module.BriefModule,
        "Top": module.TopModule,
        "Comment": module.CommentModule,
        "Link": module.LinkModule,
    },
)


class Application(tornado.web.Application):
    def __init__(self):
        tornado.web.Application.__init__(self, URLS, **SETTINGS)


if __name__ == "__main__":
    Application().listen(8888)
    tornado.ioloop.IOLoop.instance().start()