extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	IngameMusic.get_node("TitleSong").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select") and $Timer.is_stopped():
		$Timer.start()
		IngameMusic.get_node("TitleSong").stop()
		$SFX.play()


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/UI/Intro.tscn")
