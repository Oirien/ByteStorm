extends Node2D
var speed = -300
@onready var spawntime = get_tree().create_timer(15) 
# Called when the node enters the scene tree for the first time.
func _ready():
	spawntime.connect("timeout", self.queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta, 0).rotated(self.rotation)
	if ($RayCast2D.is_colliding()): 
		var player_hit = $RayCast2D.get_collider()

		player_hit.get_parent().on_hit(1)
		self.queue_free()
