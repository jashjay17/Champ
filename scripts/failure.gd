extends Control
@onready var timer: Timer = $Timer
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")




func _on_timer_timeout() -> void:
	label.visible = true
