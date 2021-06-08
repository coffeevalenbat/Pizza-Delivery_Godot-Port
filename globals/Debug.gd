extends Node

var Debug = false

func _process(delta):
	if Debug:
		if Input.is_action_just_pressed("debug_restart"):
			for i in IngameMusic.get_child_count():
				IngameMusic.get_child(i).stop()
			get_tree().change_scene("res://scenes/UI/Title.tscn")
