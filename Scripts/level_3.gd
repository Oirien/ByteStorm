extends Node2D
@onready var pausemenu = $"Pause Menu"
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var paused:bool = false
var locker: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node2D.PROCESS_MODE_PAUSABLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed("ui_pause")):
		start_pause()
	if !locker:
		if get_node_or_null("Player") != null:
			score_over_time(4)

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
	
func score_over_time(level):
	locker = true
	PlayerDataNode._add_score(level)
	await get_tree().create_timer(1).timeout
	locker = false
