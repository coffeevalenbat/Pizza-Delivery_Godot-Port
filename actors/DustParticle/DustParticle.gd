extends Node2D


onready var sprite = $Sprite

func _physics_process(delta):
	sprite.modulate.a -= .1
	sprite.scale.x += .1
	sprite.scale.y += .1
	
	if sprite.modulate.a <= 0:
		queue_free()
