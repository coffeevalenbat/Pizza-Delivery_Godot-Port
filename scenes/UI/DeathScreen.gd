extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	IngameMusic.get_node("GameOver").play()

func _on_Timer_timeout():
	Globals.reset()
	get_tree().change_scene("res://scenes/UI/Title.tscn")
