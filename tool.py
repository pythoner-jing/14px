#!/usr/bin/env python
#coding:utf-8

import markdown2
import time

from HTMLParser import HTMLParser
import functools


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
		tmp = "".join(self.rs)[:self.limit]
		return tmp if len(tmp) <= self.limit else tmp + "..."


def cut(data, size):
	return data[:size] + "..." if len(data) > size else data


def gen_time():
	return time.strftime("%Y-%m-%d %H:%M:%S")


def mdparse(content):
	return markdown2.Markdown().convert(content)


FIX_METHOD = ["PUT", "DELETE"]


def restful(method):
	@functools.wraps(method)
	def wrapper(self, *args, **kwargs):
		request_method = self.get_argument("_method", "")
		if request_method.upper() not in FIX_METHOD:
			return method(self, *args, **kwargs)
		getattr(self, request_method.lower())(*args, **kwargs)
	return wrapper


def paging(p, count, size):
	p = int(p) if p else 1
	last = count / size if count % size == 0 else count / size + 1

	if 1 <= p <= last:
		offset = p - 1
	else:
		offset = 0
		p = 1

	paging = dict(
		pre=None if p - 1 <= 0 else p - 1,
		next=None if p + 1 > last else p + 1,
		first=1,
		last=last,
		current=p,
	)

	return paging, offset
