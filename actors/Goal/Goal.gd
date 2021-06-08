extends Area2D

func _on_Goal_body_entered(body):
	if body.is_in_group("player"):
		Globals.PizzaCounter = body.ammo
		Globals.Lives = body.lives
		Globals.LevelCount += 1
		if Globals.LevelCount >= 8:
			get_tree().change_scene("res://scenes/UI/Endscreen.tscn")
		else:
			get_tree().change_scene("res://scenes/levels/level_" + str(Globals.LevelCount) + ".tscn")
