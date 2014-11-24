#!/usr/bin/env python
#coding:utf-8

from sgmllib import SGMLParser
from HTMLParser import HTMLParser
import markdown2

class Parser(HTMLParser):
	def __init__(self):
		HTMLParser.__init__(self)

		self.excludes = ["table", "ul", "ol"]
		self.rs = []
		self.tag = None

	def handle_starttag(self, tag, attrs):
		if tag in self.excludes:
			self.tag = tag

	def handle_endtag(self, tag):
		if self.tag == tag:
			self.tag = None

	def handle_data(self, data):
		if not self.tag:
			self.rs.append(data.strip())

	def output(self):
		return "".join(self.rs)

with open("markdowndemo.md") as f:
	content = f.read()
	md = markdown2.Markdown()
	content = md.convert(content)
	p = Parser()
	p.feed(content)
	print p.output()[:140]