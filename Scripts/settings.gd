extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()



func _on_back_pressed():
	var gamescene = get_node("../")
	if (gamescene.get_child_count() <= 4):
		gamescene.get_child(0).show()
	elif(gamescene.get_child_count() >=4):
		gamescene.get_child(4).show()
	self.hide()


func _on_windowed_button_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fullscreen_button_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
