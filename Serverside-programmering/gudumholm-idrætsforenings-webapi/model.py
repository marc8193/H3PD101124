#!/usr/bin/env python3

from peewee import *

db = SqliteDatabase("gudumholm-idrætsforenings.db")

class Sport(Model):
    name = CharField()
    price = IntegerField()

    class Meta:
        database = db


class Address(Model):
    road = CharField()
    city = CharField()
    zipcode = CharField()

    class Meta:
        database = db

class Member(Model):
    name = CharField()
    CPR = CharField()
    membership = CharField()

    sport = ForeignKeyField(Sport, backref="member_sport")
    address = ForeignKeyField(Address, backref="member_address")

    class Meta:
        database = db

class Kid(Model):
    
    member = ForeignKeyField(Member, backref="kid_member")
    parent = ForeignKeyField(Member, backref="kid_parent", null=True)

    class Meta:
        database = db

db.connect()

db.create_tables([Sport, Address, Member, Kid])
