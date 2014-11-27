#!/usr/bin/env python
# coding:utf-8

__author__ = 'jing'

import functools


def line(method):
    @functools.wraps(method)
    def wrapper(*args, **kwargs):
        print "---"
        return method(*args, **kwargs)
    return wrapper


@line
def star():
    print "***"


star()


