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

@app.post("/sports")
def post_sports():
    name = request.args.get("name")
    price = request.args.get("price")

    if not name or not price:
        return {"error": f"Request contains undefined key"}, 415

    sport = Sport.create(name=name, price=price)
    sport.save()

    return { "id": sport.id, "name": sport.name, "price": sport.price }, 201

@app.put("/sports")
def put_sports():
    id = request.args.get("id")
    name = request.args.get("name")
    price = request.args.get("price")

    if not id: return { "error": "Request contains undefined id" }, 422

    sport = Sport.select().where(Sport.id == id).get()

    if name: sport.name = name
    elif price: sport.price = price

    sport.save()

    return { "id": sport.id, "name": sport.name, "price": sport.price }, 201

@app.delete("/sports")
def delete_sports():
    id = request.args.get("id")

    if not id: return { "error": "Request contains undefined id" }, 422
    
    try:
        sport = Sport.select().where(Sport.id == id).get()
        sport.delete_instance()
    
    except DoesNotExist: return { "error": "Does not exist" }, 422

    return { "sucess": f"Item with id {id} has been deleted" }, 201

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

@app.post("/addresses")
def post_addresses():
    road = request.args.get("road")
    city = request.args.get("city")
    zipcode = request.args.get("zipcode")

    if not road or not city or not zipcode:
        return {"error": "Request contains undefined key"}, 415

    address = Address.create(road=road, city=city, zipcode=zipcode)
    address.save()

    return { "id": address.id, "road": address.road, 
            "city": address.city, "zipcode": address.zipcode }, 201

@app.put("/addresses")
def put_addresses():
    id = request.args.get("id")
    road = request.args.get("road")
    city = request.args.get("city")
    zipcode = request.args.get("zipcode")

    if not id: return { "error": "Request contains undefined id" }, 422

    address = Address.select().where(Address.id == id).get()

    if road: address.road = road
    elif city: address.city = city
    elif zipcode: address.zipcode = zipcode

    address.save()

    return { "id": address.id, "road": address.road, 
            "city": address.city, "zipcode": address.zipcode }, 201


@app.delete("/addresses")
def delete_addresses():
    id = request.args.get("id")

    if not id: return { "error": "Request contains undefined id" }, 422
    
    try:
        address = Address.select().where(Address.id == id).get()
        address.delete_instance()
    
    except DoesNotExist: return { "error": "Does not exist" }, 422

    return { "sucess": f"Item with id {id} has been deleted" }, 201

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

@app.post("/members")
def post_members():
    name = request.args.get("name")
    CPR = request.args.get("CPR")
    membership = request.args.get("membership")
    sport_id = request.args.get("sportId")
    address_id = request.args.get("addressId")

    if not name or not CPR or not membership or not sport_id or not address_id:
        return {"error": "Request contains undefined key"}, 415

    member = Member.create(name=name, CPR=CPR, membership=membership, sport=sport_id, address=address_id)
    member.save()

    return { "id": member.id, "name": member.name, 
            "CPR": member.CPR, "membership": member.membership, 
            "sportId": member.sport.id, "addressId": member.address.id }, 201

@app.put("/members")
def put_members():
    id = request.args.get("id")
    name = request.args.get("name")
    CPR = request.args.get("CPR")
    membership = request.args.get("membership")
    sport_id = request.args.get("sportId")
    address_id = request.args.get("addressId")

    if not id: return { "error": "Request contains undefined id" }, 422

    member = Member.select().where(Member.id == id).get()
    
    if name: member.name = name
    elif CPR: member.CPR = CPR
    elif membership: member.membership = membership
    elif sport_id: member.sport.id = sport_id
    elif address_id: member.address.id = address_id

    member.save()

    return { "id": member.id, "name": member.name, 
            "CPR": member.CPR, "membership": member.membership, 
            "sportId": member.sport.id, "addressId": member.address.id }, 201

@app.delete("/members")
def delete_members():
    id = request.args.get("id")

    if not id: return { "error": "Request contains undefined id" }, 422
    
    try:
        member = Member.select().where(Member.id == id).get()
        member.delete_instance()
    
    except DoesNotExist: return { "error": "Does not exist" }, 422

    return { "sucess": f"Item with id {id} has been deleted" }, 201


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
    #Sport.create(name="Fodbold", price=800)
    #Address.create(road="Vestergade 29", city="Nørresundy", zipcode="9400")
    #Member.create(name="Marucs Haukelid Larsen", CPR="111103-1234", membership="active", sport=1, address=1)
    #Member.create(name="Simon Haukelid Larsen", CPR="010307-1234", membership="active", sport=1, address=1)
    #Kid.create(member=2, parent=1)

    app.run()
