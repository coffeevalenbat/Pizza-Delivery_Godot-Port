extends Area2D

var player = null
var dir = 1
var speed = 3.5

func _ready():
	if dir == 0:
		dir = -1

func _physics_process(delta):
	position.x += - dir * speed


func _on_LaunchPizza_body_entered(body):
	if not body.is_in_group("player"):
		queue_free()
	if body.is_in_group("enemy"):
		body.queue_free()
		player._on_Col_body_entered(body)
		
