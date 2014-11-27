#!/usr/bin/env python
# coding:utf-8

__author__ = 'jing'

import torndb

MYSQL_HOST = "localhost"
MYSQL_PORT = 3306
MYSQL_USER = "root"
MYSQL_PASS = ""
MYSQL_DB = "14px"

DB = torndb.Connection(
    '%s:%s' % (MYSQL_HOST, str(MYSQL_PORT)),
    MYSQL_DB,
    MYSQL_USER,
    MYSQL_PASS,
    max_idle_time=5,
    connect_timeout=5,
)
