extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()



func _on_back_to_menu_pressed():
	var gamescene = get_node("../")
	gamescene.get_child(0).show()
	self.hide()


func _on_windowed_button_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fullscreen_button_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
