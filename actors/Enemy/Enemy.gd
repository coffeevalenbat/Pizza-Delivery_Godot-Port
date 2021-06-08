extends KinematicBody2D

var speed = 128
var motion = Vector2()
const target_fps = 60
const gravity = 8
var max_speed = 96
const friction = 20
const jump_boost = 200

func _physics_process(delta):
	if is_on_floor():
		motion.y = - jump_boost
		
	motion.y += gravity * delta * target_fps
	
	motion = move_and_slide(motion, Vector2.UP)
