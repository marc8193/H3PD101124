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

    blog = ForeignKeyField(Blog, backref="posts")

    class Meta:
        database = db

class Task(Model):
    name = CharField()

    class Meta:
        database = db

class Todo(Model):
    name = CharField()
    is_complete = BooleanField(default=False)

    task = ForeignKeyField(Task, backref="todos")

    class Meta:
        database = db

class Team(Model):
    name = CharField()

    class Meta:
        database = db

class Worker(Model):
    name = CharField()

    class Meta:
        database = db

class TeamWorker(Model):
    
    team = ForeignKeyField(Team, backref="teams")
    worker = ForeignKeyField(Worker, backref="workers")
    current_todo = ForeignKeyField(Todo, backref="current_todo", null=True)
    current_task = ForeignKeyField(Task, backref="current_task", null=True)
    
    class Meta:
        database = db


db.connect()

db.create_tables([Blog, Post, Task, Todo, Team, Worker, TeamWorker])
