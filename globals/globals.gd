extends Node

var PizzaCounter = 0
var Lives = 5
var LevelCount = 1

func _process(delta):
	if Input.is_action_just_pressed("debug_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	for i in range(49,52):
		if Input.is_key_pressed(i) and not OS.window_fullscreen:
			set_scale(i-48)


func reset():
	#Restarts data when the game restarts
	PizzaCounter = 0
	Lives = 5
	LevelCount = 1

func set_scale(scale):
	var real_width = ProjectSettings.get_setting("display/window/size/width")
	var real_height = ProjectSettings.get_setting("display/window/size/height")

	ProjectSettings.set_setting("display/window/size/test_width",real_width * scale)
	ProjectSettings.set_setting("display/window/size/test_height",real_height * scale)

	var scale_width = ProjectSettings.get_setting("display/window/size/test_width")
	var scale_height = ProjectSettings.get_setting("display/window/size/test_height")

	OS.set_window_size(Vector2(scale_width,scale_height))
	OS.set_window_position(Vector2( (OS.get_screen_size().x / 2) - scale_width / 2, (OS.get_screen_size().y / 2) - scale_height / 2))
