extends Control


func _ready():
	pass
	
	
func _process(_delta):
	pass

func _on_start_pressed():

	var level_1 = preload("res://Scenes/level_1.tscn").instantiate()
	get_parent().add_child(level_1)
	self.hide()
	$AudioStreamPlayer.stop()



func _on_quit_pressed():
	get_tree().quit()
