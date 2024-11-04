#!/usr/bin/env python3

from peewee import *

from model import *

print("{:=^80}".format(" Opgave 2.0 - ProjectManager "))

# Create
print("Inserting a new blog")
blog = Blog.create(url = "http://blogs.msdn.com/adonet")
blog.save()

# Read
print("Querying for a blog")
blog = Blog.select().order_by(Blog.id).first()

# Update
print("Updating the blog and adding a post")
blog.url = "https://devblogs.microsoft.com/dotnet"
blog.save()

# Delete
print("Delete the blog")
blog.delete_instance()

print("{:=^80}".format(" Opgave 2.1 - Tasks og todos "))

print("Creating task - Produce software")
produce_software_task = Task.create(name="Produce software")
produce_software_task.save()

print("Creating todo - Write code")
write_code_todo = Todo.create(task_id=produce_software_task, name="Write code")
write_code_todo.save()

print("Creating todo - Comple source")
compile_source_todo = Todo.create(task_id=produce_software_task, name="Compile source")
write_code_todo.save()

print("Creating todo - Test program")
test_program_todo = Todo.create(task_id=produce_software_task, name="Test program")
test_program_todo.save()

print("Creating task - Brew coffee")
brew_coffee_task = Task.create(name="Brew coffee")
brew_coffee_task.save()

print("Creating todo - Pour water")
pour_water_todo = Todo.create(task_id=brew_coffee_task, name="Pour water")
pour_water_todo.save()

print("Creating todo - Pour coffee")
pour_coffee_todo = Todo.create(task_id=brew_coffee_task, name="Pour coffee")
pour_coffee_todo.save()

print("Creating todo - Turn on")
turn_on_todo = Todo.create(task_id=brew_coffee_task, name="Turn on")
turn_on_todo.save()

print("{:=^80}".format(" Opgave 2.2 - Print ufærdige tasks og todos "))

for incomplete_todo in Todo.select().where(Todo.is_complete == False):
    task = Task.select().where(Task.id == incomplete_todo.task_id).get()
    
    print(f"Task: {task.name} -  Todo: {incomplete_todo.name}")
