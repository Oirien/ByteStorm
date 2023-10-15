extends Node2D
var lifespan = 15
var spawntime = Time.get_ticks_msec()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (Time.get_ticks_msec() - spawntime > lifespan*1000):
		self.queue_free()
