extends Node2D
var speed = -300
var spawntime = Time.get_ticks_msec()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta, 0).rotated(self.rotation)
	if ($RayCast2D.is_colliding()): 
		var player_hit = $RayCast2D.get_collider()
		player_hit.get_parent().on_hit(1)
		self.queue_free()	
	if (Time.get_ticks_msec() - spawntime > 15000):
		self.queue_free()
		
