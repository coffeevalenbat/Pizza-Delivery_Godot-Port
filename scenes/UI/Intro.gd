extends Node2D

var count = 1
var intro = {
	"1" : {
		Time = 3.35,
		Sound = "MusicPlayer",
		stop = false,
	},
	"2" : {
		Time = 7,
		Sound = "Break",
		stop = false,
	},
	"3" : {
		Time = 3,
		Sound = null,
		stop = false,
	},
	"4" : {
		Time = 5,
		Sound = "Ringtone",
		stop = true,
	},
	"5" : {
		Time = 5,
		Sound = "Ringtone",
		stop = true,
	},
	"6" : {
		Time = 10.47,
		Sound = "JeffSpeech",
		stop = true,
	},
	"7" : {
		Time = 5,
		Sound = null,
		stop = true,
	},
}


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = count - 1
	var current = intro[str(count)]
	$Timer.wait_time = current.Time
	if current.stop:
		for i in IngameMusic.get_child_count():
			IngameMusic.get_child(i).stop()
	if current.Sound != null:
		IngameMusic.get_node(current.Sound).play()
	$Timer.start()


func _process(delta):
	if Input.is_action_just_pressed("game_jump"):
		count = 7
		_on_Timer_timeout()


func _on_Timer_timeout():
	count += 1
	if count >= 8:
		IngameMusic.get_node("MusicPlayer").play()
		get_tree().change_scene("res://scenes/levels/level_1.tscn")
	else:
		_ready()
