extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

var health = 50
var score_value = 500
var credit_value = 100
var shooting:bool = false
var attack_style:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate(get_angle_to(self.get_parent().get_child(3).position) + PI/2) 
