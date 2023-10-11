extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position += Vector2(10,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(10,0)
	if ($RayCast2D.is_colliding()): 
		self.queue_free()
