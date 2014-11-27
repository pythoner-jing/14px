#!/usr/bin/env python
# coding:utf-8


class A:
    def __init__(self):
        pass

    def output(self):
        print "I am class A!"


class B(A):
    def __init__(self):
        A.__init__(self)

    def output(self):
        print repr(self)
        print "I am class B!"

b = B()
b.output()