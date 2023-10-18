extends Node2D
@onready var pausemenu = $"Pause Menu"
var paused:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node2D.PROCESS_MODE_PAUSABLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed("ui_pause")):
		start_pause()

func on_hit(damage):
	pass

func start_pause():
	if (paused):
		pausemenu.hide()
		Engine.time_scale = 1
	else:
		pausemenu.show()
		Engine.time_scale = 0
	paused = !paused


#Planning for level 3
#
# Mini boss like enemies populate at start
# Real boss spawns at 30s
#
# Mini enemies have 2 attacks, tri-attack and targetted(randomly choosing which to fire
# Boss has very slow speed, but disappears every 10s for 5s
# 4 Mini bosses, don't respawn
#
# Boss starts laser at 50%hp
#
