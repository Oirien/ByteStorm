extends Node2D
@onready var pausemenu = $"Pause Menu"
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var paused:bool = false
var locker: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node2D.PROCESS_MODE_PAUSABLE
	label_splash()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if !locker:
		if get_node("Level3Boss").get_child(0).get_child(0).get_child(0).health > 0:
			if get_node_or_null("Player") != null:
				score_over_time(4)

func label_splash():
	$Label.show()
	await get_tree().create_timer(2).timeout
	$Label.hide()
	await get_tree().create_timer(.2).timeout
	for flash in range(3):
		$Label.show()
		await get_tree().create_timer(.1).timeout
		$Label.hide()
		await get_tree().create_timer(.1).timeout

func on_hit(damage):
	pass
	
func score_over_time(level):
	locker = true
	PlayerDataNode._add_score(level)
	await get_tree().create_timer(1).timeout
	locker = false
