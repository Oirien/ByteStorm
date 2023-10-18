extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($RayCast2D.is_colliding()):
		var player_hit = $RayCast2D.get_collider()
		player_hit.get_parent().on_hit(1)
