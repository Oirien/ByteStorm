extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var health =2
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_hit(damage):
	health -= damage
	if (health <= 0):
		PlayerDataNode._add_score(5)
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spawner = get_child(0)
		var sprite = get_child(1)
		spawner.free()
		sprite.free()
