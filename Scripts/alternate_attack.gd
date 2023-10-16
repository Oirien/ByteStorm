extends Node2D
var lifespan:int = 15
var spawntime = Time.get_ticks_msec()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_child(0).position = Vector2(-50,-50)
	self.get_child(1).position = Vector2(-50,50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (Time.get_ticks_msec() - spawntime > lifespan*1000):
		self.queue_free()
