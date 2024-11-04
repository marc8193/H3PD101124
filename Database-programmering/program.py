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
write_code_todo = Todo.create(task=produce_software_task, name="Write code")
write_code_todo.save()

print("Creating todo - Comple source")
compile_source_todo = Todo.create(task=produce_software_task, name="Compile source")
write_code_todo.save()

print("Creating todo - Test program")
test_program_todo = Todo.create(task=produce_software_task, name="Test program")
test_program_todo.save()

print("Creating task - Brew coffee")
brew_coffee_task = Task.create(name="Brew coffee")
brew_coffee_task.save()

print("Creating todo - Pour water")
pour_water_todo = Todo.create(task=brew_coffee_task, name="Pour water")
pour_water_todo.save()

print("Creating todo - Pour coffee")
pour_coffee_todo = Todo.create(task=brew_coffee_task, name="Pour coffee")
pour_coffee_todo.save()

print("Creating todo - Turn on")
turn_on_todo = Todo.create(task=brew_coffee_task, name="Turn on")
turn_on_todo.save()

print("{:=^80}".format(" Opgave 2.2 - Print ufærdige tasks og todos "))

for incomplete_todo in Todo.select().where(Todo.is_complete == False):
    task = Task.select().where(Task.id == incomplete_todo.task).get()
    
    print(f"Task: {task.name} - Todo: {incomplete_todo.name}")

print("{:=^80}".format(" Opgave 2.3 - Workers og teams "))

print("Creating team - Frontend")
frontend_team = Team.create(name="Frontend")
frontend_team.save()

print("Creating worker - Steen Secher")
steen_secher_worker = Worker.create(name="Steen Secher")
steen_secher_worker.save()

steen_secher_teamworker_frontend = TeamWorker.create(team=frontend_team.id, worker=steen_secher_worker.id)
steen_secher_teamworker_frontend.save()

print("Creating worker - Ejvind Møller")
ejvind_moeller_worker = Worker.create(name="Ejvind Møller")
ejvind_moeller_worker.save()

ejvind_moeller_teamworker_frontend = TeamWorker.create(team=frontend_team.id, worker=ejvind_moeller_worker.id)
ejvind_moeller_teamworker_frontend.save()

print("Creating worker - Konrad Sommer")
konrad_sommer_worker = Worker.create(name="Konrad Sommer")
konrad_sommer_worker.save()

konrad_sommer_teamworker_frontend = TeamWorker.create(team=frontend_team.id, worker=konrad_sommer_worker.id)
konrad_sommer_teamworker_frontend.save()

print("Creating team - Backend")
backend_team = Team.create(name="Backend")
backend_team.save()

konrad_sommer_teamworker_backend = TeamWorker.create(team=backend_team.id, worker=konrad_sommer_worker.id)
konrad_sommer_teamworker_backend.save()

print("Creating worker - Sofus Lotus")
sofus_lotus_worker = Worker.create(name="Sofus Lotus")
sofus_lotus_worker.save()

sofus_lotus_teamworker_backend = TeamWorker.create(team=backend_team.id, worker=sofus_lotus_worker.id)
sofus_lotus_teamworker_backend.save()

print("Creating worker - Remo Lademann")
remo_lademann_worker = Worker.create(name="Remo Lademann")
remo_lademann_worker.save()

remo_lademann_teamworker_backend = TeamWorker.create(team=backend_team.id, worker=remo_lademann_worker.id)
remo_lademann_teamworker_backend.save()

print("Creating team - Testere")
testere_team = Team.create(name="Testere")
testere_team.save()

print("Creating worker - Ella Fanth")
ella_fanth_worker = Worker.create(name="Ella Fanth")
ella_fanth_worker.save()

ella_fanth_teamworker_testere = TeamWorker.create(team=testere_team.id, worker=ella_fanth_worker.id)
ella_fanth_teamworker_testere.save()

print("Creating worker - Anne Dam")
anne_dam_worker = Worker.create(name="Anne Dam")
anne_dam_worker.save()

anne_dam_teamworker_testere = TeamWorker.create(team=testere_team.id, worker=anne_dam_worker.id)
anne_dam_teamworker_testere.save()

steen_secher_teamworker_testere = TeamWorker.create(team=testere_team.id, worker=steen_secher_worker.id)
steen_secher_teamworker_testere.save()

print("{:=^80}".format(" Opgave 2.4 - Sammenkædning af opgaver og teams "))

print("Creating task - Frontend task")
frontend_task = Task.create(name="Frontend task")
frontend_task.save()

frontend_team.current_task = frontend_task
frontend_task.save()

print("Creating todo - Frontend todo")
frontend_todo = Todo.create(task=frontend_task, name="Frontend todo")
frontend_todo.save()

for teamworker in TeamWorker.select().where(TeamWorker.team == frontend_team):
        teamworker.current_task = frontend_task
        teamworker.current_todo = frontend_todo
        teamworker.save()

print("Creating task - Backend task")
backend_task = Task.create(name="Backend task")
backend_task.save()

print("Creating todo - Backend todo")
backend_todo = Todo.create(task=backend_task, name="Backend todo")
backend_todo.save()

for teamworker in TeamWorker.select().where(TeamWorker.team == backend_team):
        teamworker.current_task = backend_task
        teamworker.current_todo = backend_todo
        teamworker.save()

print("Creating task - Testere task")
testere_task = Task.create(name="Testere task")
testere_task.save()

print("Creating todo - Testere todo")
testere_todo = Todo.create(task=backend_task, name="Testere todo")
testere_todo.save()

for teamworker in TeamWorker.select().where(TeamWorker.team == testere_team):
        teamworker.current_task = testere_task
        teamworker.current_todo = testere_todo
        teamworker.save()

print("{:=^80}".format(" Opgave 2.5 - metoden PrintTeamsWithoutTasks() "))

print("Creating team - Without task")
without_task_team = Team.create(name="Without task")
without_task_team.save()

anne_dam_teamworker_without_task = TeamWorker.create(team=without_task_team.id, worker=anne_dam_worker.id)
anne_dam_teamworker_without_task.save()

for teamworker in TeamWorker.select().where(TeamWorker.current_task == None):
    for team in Team.select().where(Team.id == teamworker.team):
        print(f"Team: {team.name}")

print("{:=^80}".format(" Opgave 2.6 - metoden PrintTeamCurrentTask() "))

for teamworker in TeamWorker.select():
    team = Team.select().where(Team.id == teamworker.team).get()
    
    task = None
    if teamworker.current_task: task = Task.select().where(Task.id == teamworker.current_task).get()
    
    try: print(f"Team: {team.name} - Task: {task.name}")
    except AttributeError: print(f"Team: {team.name} - Task: None")
   
print("{:=^80}".format(" Opgave 2.7 - metoden PrintTeamProgress() "))

for team in Team.select():
    todos = []

    for teamworker in TeamWorker.select().where(TeamWorker.team == team.id):
        todo = None
        if teamworker.current_task: 
            todo = Todo.select().where(Todo.id == teamworker.current_task).get()
            todos.append(todo)

    done_todos = 0
    for todo in todos: 
        if todo.is_complete == True: done_todos += 1
        
    
    try: print(f"Team: {team.name} - {done_todos} out of {len(todos)} todos is done ({100/len(todos)*done_todos}%)")
    except ZeroDivisionError: print(f"Team: {team.name} - No todos")

