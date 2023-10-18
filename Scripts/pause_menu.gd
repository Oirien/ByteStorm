extends Control
@onready var gamescene = get_node("../../")
var paused:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed("ui_pause")):
		start_pause()


func _on_resume_pressed():
	self.hide()
	Engine.time_scale = 1

func start_pause():
	if (paused):
		gamescene.get_node("Settings").hide()
		self.hide()
		if (gamescene.get_child_count() <= 4):
			gamescene.get_child(0).show()
		elif(gamescene.get_child_count() >=4):
			gamescene.get_child(4).show()
		self.hide()
		Engine.time_scale = 1
	else:
		self.show()
		Engine.time_scale = 0
	paused = !paused

func _on_quit_pressed():
	
	gamescene.get_child(0).show()
	gamescene.get_child(0).get_node("AudioStreamPlayer").play()
	gamescene.get_child(4).queue_free()
	Engine.time_scale = 1


func _on_button_pressed():
	gamescene.get_child(4).hide()
	gamescene.get_node("Settings").show()
	
