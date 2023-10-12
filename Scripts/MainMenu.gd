extends MarginContainer
var level_1 = preload("res://Scenes/level_1.tscn").instantiate()



func _on_start_pressed():
#	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	get_parent().add_child(level_1)
	self.queue_free()

