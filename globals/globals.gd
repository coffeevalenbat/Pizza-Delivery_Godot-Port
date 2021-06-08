extends Node

var PizzaCounter = 0
var Lives = 5
var LevelCount = 1

func _process(delta):
	if Input.is_action_just_pressed("debug_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func reset():
	PizzaCounter = 0
	Lives = 5
	LevelCount = 1
