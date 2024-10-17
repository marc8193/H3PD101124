extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:			
	var sizeX = randi() % 200 + 50
	var sizeY = randi() % 50 + 10
	
	$Polygon2D.polygon = [Vector2(0, 0), Vector2(sizeX, 0), Vector2(sizeX, sizeY), Vector2(0, sizeY)]	
	
	$CollisionShape2D.shape.set_size(Vector2(sizeX, sizeY))
	$CollisionShape2D.position = Vector2(sizeX/2, sizeY/2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
