extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func on_hit(damage):
	health -= damage
	if (health >= 0):
		PlayerDataNode._add_score(5)
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spinner = get_child(0)
		var sprite = get_child(1)
		var collision_box = get_child(2)
		spinner.free()
		sprite.free()
		collision_box.free()


func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
