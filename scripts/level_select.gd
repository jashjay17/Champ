extends Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D



func _process(delta: float) -> void:
	if  Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scences/main_menu.tscn")


func _on_morning_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/coming.tscn")
	


func _on_afternoon_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/afternoon.tscn")
	



func _on_evening_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/night.tscn")
