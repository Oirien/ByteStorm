extends Node2D
@onready var pausemenu = $"Pause Menu"
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node2D.PROCESS_MODE_PAUSABLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_pause")):
		start_pause()

func on_hit():
	pass

func start_pause():
	if (paused):
		pausemenu.get_child(0).hide()
		Engine.time_scale = 1
	else:
		pausemenu.get_child(0).show()
		Engine.time_scale = 0
	paused = !paused
