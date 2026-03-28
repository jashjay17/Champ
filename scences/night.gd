extends Node2D
@onready var level_timer: Timer = $"Level timer"
@onready var time_left: Label = $"time left"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_timer.start()
	
func _process(delta: float) -> void:
	time_left.text = str(floor(level_timer.time_left))
	if  Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")
		 

func _on_level_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scences/night_victory.tscn")
