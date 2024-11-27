#!/usr/bin/env python3

from flask import Flask, jsonify, request

from model import *

app = Flask(__name__)

@app.get("/sports")
def get_sports():
    id = request.args.get("id")

    sports = []
    try:
        if id:
                sport = Sport.select().where(Sport.id == id).get()
                sports.append({ "id": sport.id, "name": sport.name, "price": sport.price })

        else:
            for sport in Sport.select().order_by(Sport.id):
                sports.append({ "id": sport.id, "name": sport.name, "price": sport.price })

    except DoesNotExist: return { "error": "Does not exist" }, 422
    
    response = jsonify(sports)
    
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

@app.get("/addresses")
def get_addresses():
    id = request.args.get("id")

    addresses = []
    try:
        if id:
                address = Address.select().where(Address.id == id).get()
                addresses.append({ "id": address.id, "road": address.road, 
                                  "city": address.city, "zipcode": address.zipcode })

        else:
            for address in Address.select().order_by(Address.id):
                addresses.append({ "id": address.id, "road": address.road, 
                                  "city": address.city, "zipcode": address.zipcode })

    except DoesNotExist: return { "error": "Does not exist" }, 422
    
    response = jsonify(addresses)
    
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

@app.get("/members")
def get_members():
    id = request.args.get("id")

    members = []
    try:
        if id:
                member = Member.select().where(Member.id == id).get()
                members.append({ "id": member.id, "name": member.name, 
                                "CPR": member.CPR, "membership": member.membership, 
                                "sporId": member.sport.id, "addressId": member.address.id })
        
        else:
            for member in Member.select().order_by(Member.id):
                members.append({ "id": member.id, "name": member.name, 
                                "CPR": member.CPR, "membership": member.membership, 
                                "sporId": member.sport.id, "addressId": member.address.id })
    
    except DoesNotExist: return { "error": "Does not exist" }, 422
    
    response = jsonify(members)
    
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

@app.get("/kids")
def get_kids():
    id = request.args.get("id")

    kids = []
    try:
        if id:
                kid = Kid.select().where(Kid.id == id).get()
                kids.append({ "memberId": kid.member.id, "parentId": kid.parent.id })

        else:
            for kid in Kid.select().order_by(Kid.id):
                kids.append({ "memberId": kid.member.id, "parentId": kid.parent.id })
                
    except DoesNotExist: return { "error": "Does not exist" }, 422
    
    response = jsonify(kids)
    
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response


if __name__ == "__main__":
    Sport.create(name="Fodbold", price=700)
    Address.create(road="Vestergade 29", city="Nørresundy", zipcode="9400")
    Member.create(name="Marucs Haukelid Larsen", CPR="111103-1234", membership="active", sport=1, address=1)
    Member.create(name="Simon Haukelid Larsen", CPR="010307-1234", membership="active", sport=1, address=1)
    Kid.create(member=2, parent=1)

    app.run()
