extends Node2D
@onready var batter: CharacterBody2D = $Batter

@onready var ball = preload("res://scences/ball.tscn")
@onready var machine: Node2D = $"."
var answer = 0
@onready var batter_sprite: AnimatedSprite2D = $Batter/batter_sprite
@onready var batter_collision: CollisionShape2D = $Batter/batter_collision
@onready var angry: AudioStreamPlayer2D = $Batter/angry

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if answer == 1:
		success()
	elif answer == -1:
		failure()
	



func shoot_func(bullettype):
	var bullet_temp = bullettype.instantiate()
	get_tree().root.add_child(bullet_temp)
	bullet_temp.direction = -1
	bullet_temp.position.x = machine.position.x
	bullet_temp.position.y = machine.position.y - 25

func success():
		batter_collision.disabled = false
		shoot_func(ball)
		answer = 0
		batter_sprite.play("swing")
		

func failure():
	batter_collision.disabled = true
	shoot_func(ball)
	angry.play()
	answer = 0
	batter_sprite.play("miss")
	
