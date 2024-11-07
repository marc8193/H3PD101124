#!/usr/bin/env python3

from flask import Flask, jsonify, request

from model import *

app = Flask(__name__)

@app.get("/")
def get_todos():
    id = request.args.get("id")
    todos = []

    if id:
        todo = TodoItem.select().where(TodoItem.id == id).get()
        todos.append({ "id": todo.id, "name": todo.name, "is_complete": todo.is_complete })
    else:
        for todo in TodoItem.select().order_by(TodoItem.id):
            todos.append({ "id": todo.id, "name": todo.name, "is_complete": todo.is_complete })

    return jsonify(todos)

@app.post("/")
def post_todo_item():
    if request.is_json:
        todo = request.get_json()
        try:
            todo = TodoItem.create(name=todo["name"], is_complete=todo["is_complete"])
            todo.save()
        
            return { "id": todo.id, "name": todo.name, "is_complete": todo.is_complete }, 201
        
        except KeyError as err:
            return {"error": f"Request contains undefined key - {err}"}, 415
    
    return {"error": "Request must be JSON"}, 415


@app.put("/")
def put_todo_item():
    id = request.args.get("id")
    name = request.args.get("name")
    is_complete = request.args.get("is_complete")

    if not id: return { "error": "Request contains undefined id" }, 422

    todo = TodoItem.select().where(TodoItem.id == id).get()

    if name: todo.name = name
    if is_complete:
        if is_complete.lower() == "true": todo.is_complete = True
        elif is_complete.lower() == "false": todo.is_complete = False
        else: return { "error": "Request contains undefined value for is_complete" }, 422

    todo.save()

    return { "id": todo.id, "name": todo.name, "is_complete": todo.is_complete }, 201

@app.delete("/")
def delete_todo_item():
    id = request.args.get("id")

    if not id: return { "error": "Request contains undefined id" }, 422

    todo = TodoItem.select().where(TodoItem.id == id).get()
    todo.delete_instance()

    return { "sucess": f"Item with id {id} has been deleted" }, 201

if __name__ == "__main__":
    app.run()
