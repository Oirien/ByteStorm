extends Node2D
var speed = -500
@onready var _animated_bullet = $Area2D/AnimatedSprite2D
var bullet_hit = false
@onready var spawntime = get_tree().create_timer(15)
# Called when the node enters the scene tree for the first time.
func _ready():
	spawntime.connect("timeout", self.queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta, 0).rotated(self.rotation)
	if ($RayCast2D.is_colliding() and bullet_hit == false):
		bullet_hit = true 
		var player_hit = $RayCast2D.get_collider()
		player_hit.get_parent().on_hit(1)
		_animated_bullet.play("default")





func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
