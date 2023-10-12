extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	#var main_menu = preload("res://Scenes/main_menu.tscn").instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_resume_pressed():
	self.hide()
	Engine.time_scale = 1


func _on_quit_pressed():
	var gamescene = get_node("../../")
	
	
	gamescene.get_child(0).show()
	gamescene.get_child(1).queue_free()
	Engine.time_scale = 1
