extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var laser_warning = $CPUParticles2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var ShopNode = get_tree().get_root().get_node("Game").get_node("Shop")
var health = 50
var score_value = 5000
var credit_value = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()
	laser_warning.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_hit(damage):
	health -= damage
	if (health <= 0):
		PlayerDataNode._add_score(score_value)
		PlayerDataNode._add_credits(credit_value)
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spawner = get_child(0)
		var sprite = get_child(1)
		spawner.free()
		sprite.free()

func _on_animated_sprite_2d_animation_finished():
	ShopNode.show()
	get_tree().get_root().get_node("Game").get_node("level_3").queue_free()
