extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(-1,0).rotated(self.rotation)
	if ($RayCast2D.is_colliding()): 
		print("Hit!")
