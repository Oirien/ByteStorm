extends Control
@onready var gamescene = get_node("../../")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_resume_pressed():
	self.hide()
	Engine.time_scale = 1


func _on_quit_pressed():
	
	gamescene.get_child(0).show()
	gamescene.get_child(0).get_node("AudioStreamPlayer").play()
	gamescene.get_child(4).queue_free()
	Engine.time_scale = 1


func _on_button_pressed():
	print(gamescene)
	gamescene.get_child(4).hide()
	gamescene.get_node("Settings").show()
	
