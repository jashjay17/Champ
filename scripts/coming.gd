extends Node2D 

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_file("res://scences/game.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scences/game.tscn")
