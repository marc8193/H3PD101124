extends Node

@export var collider_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_player_collision() -> void:
	game_over()

func game_over() -> void:
	$ScoreTimer.stop()
	$ColliderTimer.stop()
	
	$HUD.show_game_over()

func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	
	get_tree().call_group("colliders", "queue_free")

func _on_start_timer_timeout() -> void:
	$ColliderTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout() -> void:
	score += 1
	
	$HUD.update_score(score)

func _on_collider_timer_timeout() -> void:
	var collider = collider_scene.instantiate()

	# Choose a random location on Path2D.
	var collider_spawn_location = $ColliderPath/ColliderSpawnPath
	collider_spawn_location.progress_ratio = randf()

	# Set the mob's position to a random location.
	collider.position = collider_spawn_location.position

	# Choose the gravity for collider.
	collider.set_gravity_scale(collider.gravity_scale + score / 2)
	
	# Change color
	var oldColor = $ColorRect.color
	$ColorRect.set_color(oldColor)
		
	# Spawn the mob by adding it to the Main scene.
	add_child(collider)

func _on_hud_start_game() -> void:
	new_game()
