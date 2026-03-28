extends Node2D

var game_complete = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game_complete = 1


func _process(delta: float):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")
