extends Node2D

var speed = 900
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position += Vector2(10,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta,0)
	if ($RayCast2D.is_colliding()):
		var enemy_hit = $RayCast2D.get_collider()
		enemy_hit.get_parent().on_hit()
		self.queue_free()
