extends Area2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position+=Vector2(-speed*delta,0)
	if ($AlternateAttackSprite2D/AlternateAttackRayCast2D.is_colliding()): 
		var player_hit = $AlternateAttackSprite2D/AlternateAttackRayCast2D.get_collider()
		player_hit.get_parent().on_hit(1)
		self.queue_free()
