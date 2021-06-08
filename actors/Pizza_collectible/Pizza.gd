extends Area2D

func _on_Pizza_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		body.ammo += 1
		body.SFX.get_node("Collected").play()
