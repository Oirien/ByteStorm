extends Control




func _on_start_pressed():
#	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	var level_1 = preload("res://Scenes/level_1.tscn").instantiate()
	get_parent().add_child(level_1)
	self.hide()



func _on_quit_pressed():
	get_tree().quit()
