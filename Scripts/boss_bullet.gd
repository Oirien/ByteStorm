extends Node2D
var speed = -300
@onready var _animated_bullet = $Area2D/AnimatedSprite2D
var bullet_hit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta, 0).rotated(self.rotation)
	if ($RayCast2D.is_colliding() and bullet_hit == false):
		bullet_hit = true 
		var player_hit = $RayCast2D.get_collider()
		player_hit.get_parent().on_hit()
		_animated_bullet.play("default")
		





func _on_animated_sprite_2d_animation_finished():
	self.queue_free()