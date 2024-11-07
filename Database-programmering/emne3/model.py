#!/usr/bin/env python3

from peewee import *

db = SqliteDatabase("todo.db")

class TodoItem(Model):
    name = CharField()
    is_complete = CharField()

    class Meta:
        database = db

db.connect()

db.create_tables([TodoItem])
