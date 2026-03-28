extends Control

@onready var credits_timer: Timer = $"CREDITS TIMER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	credits_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if  Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")


func _on_credits_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scences/main_menu.tscn")
