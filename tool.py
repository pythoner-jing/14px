#!/usr/bin/env python
#coding:utf-8

import markdown2
import time

from HTMLParser import HTMLParser

class BriefParser(HTMLParser):
	def __init__(self, limit):
		HTMLParser.__init__(self)

		self.excludes = ["table", "ul", "ol"]
		self.rs = []
		self.tag = None
		self.limit = limit

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
		return "".join(self.rs)[:self.limit] + "..."

def cut(data, size):
	return data[:size]

def gen_time():
	return time.strftime("%Y-%m-%d %H:%M:%S")

def mdparse(content):
	return markdown2.Markdown().convert(content)
