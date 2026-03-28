extends Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	audio_stream_player_2d.play()
	get_tree().change_scene_to_file("res://scences/level_select.tscn")


func _on_quit_pressed() -> void:
	audio_stream_player_2d.play()
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/CREDITS.tscn")
