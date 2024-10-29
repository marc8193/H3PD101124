extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScoreLabel.hide()
	$Message.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_game_over() -> void:
	$Message.show()

	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	$Message.hide()
	$StartButton.hide()
	$ScoreLabel.show()
	start_game.emit()
