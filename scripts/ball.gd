extends Area2D
const height = 0
var Speed = 300
var direction = -1
var max_distance = 600
@onready var ball_sprite: AnimatedSprite2D = $ball_sprite
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	ball_sprite.play("default")
#bullet shot
func _process(delta: float) -> void:
	position.x += Speed * delta * direction 
	max_distance = max_distance - 4
	if max_distance < 0:
		queue_free()


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	direction = 1
	Speed = 1200
	ball_sprite.play("hit")
	audio_stream_player_2d.play()
