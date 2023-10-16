extends Node2D
var minion = load("res://Scenes/Level2MinionScene.tscn")
var spawning:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var going_left:bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if going_left:
		self.rotate(-0.3*delta)
	else:
		self.rotate(0.3*delta)
	if (self.rotation > 0.9 && self.rotation <1):
		going_left = !going_left
	if (self.rotation < -0.9 && self.rotation > -1):
		going_left = !going_left
		
		
	if !spawning:
		spawning = true
		_spawn_minion()
		await get_tree().create_timer(1.5).timeout
		spawning = false

func _spawn_minion():
	var new_minion = minion.instantiate()
	new_minion.position = self.position
	self.add_child(new_minion)
	new_minion.reparent(self.get_parent())
