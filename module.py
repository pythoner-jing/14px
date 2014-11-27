#!/usr/bin/env python
# coding:utf-8

__author__ = 'jing'


import tornado.web
import tool
from db import *


class BriefModule(tornado.web.UIModule):
    def render(self, article):
        sql = "SELECT tagname FROM Article_Tag AS a,\
		Tag AS t WHERE a.article_id=%s AND a.tag_id=t.id"
        article["tags"] = DB.query(sql, article["id"])
        return self.render_string("modules/brief.html", article=article)


class RecentCommentModule(tornado.web.UIModule):
    def render(self, comment):
        sql = "SELECT * FROM Guest WHERE id=%s"
        sql2 = "SELECT * FROM Article WHERE id=%s"
        comment["guest"] = DB.get(sql, comment["guest_id"])
        comment["article"] = DB.get(sql2, comment["article_id"])
        return self.render_string("modules/recent_comment.html", comment=comment, cut=tool.cut)


class TopModule(tornado.web.UIModule):
    def render(self, article):
        return self.render_string("modules/top.html", article=article)


class CommentModule(tornado.web.UIModule):
    def render(self, article, comment):
        sql = "SELECT * FROM Guest WHERE id=%s"
        comment["guest"] = DB.get(sql, comment["guest_id"])
        if comment["ref"]:
            comment["ref"] = DB.get(sql, comment["ref"])
        return self.render_string("modules/comment.html", article=article, comment=comment)