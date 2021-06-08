extends Area2D

func _on_KillZone_body_entered(body):
	if body.is_in_group("player"):
		body.lives -=1
		if body.lives == 0:
			IngameMusic.get_node("MusicPlayer").stop()
			get_tree().change_scene("res://scenes/UI/DeathScreen.tscn")
		else:
			Globals.PizzaCounter = body.ammo
			Globals.Lives = body.lives
			IngameMusic.get_node("Death").play()
			get_tree().change_scene("res://scenes/levels/level_" + str(Globals.LevelCount) + ".tscn")
