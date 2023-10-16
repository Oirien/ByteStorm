extends Area2D
var distance_travelled = 0
var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	self.rotation = -PI/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate(delta*PI/9)
	distance_travelled += delta*speed
	self.position=(Vector2.LEFT*distance_travelled)
	if ($Sprite2D/RayCast2D.is_colliding()): 
		var player_hit = $Sprite2D/RayCast2D.get_collider()
		player_hit.get_parent().on_hit(1)
		self.queue_free()
