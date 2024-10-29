extends RigidBody2D

signal hit

@export var visual_range: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mobs = get_tree().get_nodes_in_group("mobs")
	#for mob in mobs:
		#var distance = self.position.distance_squared_to(mob.position)	
		#if distance > 0 and distance < visual_range: 
			#print(distance)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
