extends Button



func _on_pressed():
	if Input.is_action_just_pressed("EscapeGame"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
