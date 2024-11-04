#!/usr/bin/env python3

from peewee import *

db = SqliteDatabase("blogging.db")

class Blog(Model):
    url = CharField()

    class Meta:
        database = db

class Post(Model):
    title = CharField()
    content = CharField()

    blod_id = ForeignKeyField(Blog, backref="posts")

    class Meta:
        database = db

class Task(Model):
    name = CharField()

    class Meta:
        database = db

class Todo(Model):
    name = CharField()
    is_complete = BooleanField(default=False)

    task_id = ForeignKeyField(Task, backref="todos")

    class Meta:
        database = db

db.connect()

db.create_tables([Blog, Post, Task, Todo])
