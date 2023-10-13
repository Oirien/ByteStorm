extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)


func _ready():
	pass
	
	
func _process(_delta):
	pass

func _on_start_pressed():

	var level_1 = preload("res://Scenes/level_1.tscn").instantiate()
	get_parent().add_child(level_1)
	PlayerDataNode._reset()
	self.hide()
	$AudioStreamPlayer.stop()



func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	self.hide()
	var gamescene = get_node("../")
	gamescene.get_child(2).show()
