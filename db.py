#!/usr/bin/env python
# coding:utf-8

__author__ = 'jing'

import torndb
import os

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
    '%s:%s' % (MYSQL_HOST, str(MYSQL_PORT)),
    MYSQL_DB,
    MYSQL_USER,
    MYSQL_PASS,
    max_idle_time=5,
    connect_timeout=5,
)
