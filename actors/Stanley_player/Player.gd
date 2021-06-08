extends KinematicBody2D

var speed = 128
var motion = Vector2()
const target_fps = 60
const gravity = 8
var max_speed = 96
const friction = 20
const jump_boost = 320
const DustJump = preload("res://actors/DustParticle/DustParticle.tscn")
const LaunchPizza = preload("res://actors/LaunchPizza/LaunchPizza.tscn")

onready var UI = $"../UI"

var lives = Globals.Lives
var ammo = Globals.PizzaCounter

onready var animationPlayer = $AnimatedSprite
onready var SFX = $SFX

func instance_dust():
	var Instance = DustJump.instance()
	Instance.position = position
	Instance.position.y += 8
	get_tree().current_scene.add_child(Instance)

func instance_launch():
	var Instance = LaunchPizza.instance()
	Instance.position = position
	Instance.position.y += 8
	Instance.player = self
	Instance.dir = int(animationPlayer.flip_h)
	get_tree().current_scene.add_child(Instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var x_input = Input.get_action_strength("game_right") - Input.get_action_strength("game_left")
	if x_input != 0:
		animationPlayer.play("Walk")
		motion.x += x_input * speed * delta * target_fps
		motion.x = clamp(motion.x, -max_speed, max_speed)
		animationPlayer.flip_h = x_input < 0
	else:
		animationPlayer.play("Idle")
	if Input.is_action_pressed("game_run"):
		max_speed = 148
	else:
		max_speed = 96
	if Input.is_action_just_pressed("game_shoot") and ammo > 0:
		instance_launch()
		SFX.get_node("Shoot").play()
		ammo -= 1
	if x_input == 0:
		motion.x = lerp(motion.x, 0, friction * delta)
	if is_on_floor():
		if Input.is_action_just_pressed("game_jump"):
			motion.y = - jump_boost
			SFX.get_node("Jump").play()
			instance_dust()
	
	if UI != null:
		UI.get_node("Text_lifes").bbcode_text = "[center]" + str(lives) + "[center]"
		UI.get_node("Text_ammo").bbcode_text = "[center]" + str(ammo) + "[center]"
	
	
	motion.y += gravity * delta * target_fps
	
	motion = move_and_slide(motion, Vector2.UP)


func _on_Col_body_entered(body):
	body.queue_free()
	SFX.find_node("DefeatedEnemy").play()
