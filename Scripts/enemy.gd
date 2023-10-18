extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var ShopNode = get_tree().get_root().get_node("Game").get_node("Shop")
@onready var PlayerNode = get_tree().get_root().get_node("Game").get_node("Level 1").get_node("Player")
var health = 50
var score_value = 500
var credit_value = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func on_hit(damage):
	health -= damage
	if (health <= 0):
		PlayerDataNode._add_score(score_value)
		PlayerDataNode._add_credits(credit_value)
		$explosion.play()
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spinner = get_child(0)
		var sprite = get_child(1)
		var collision_box = get_child(2)
		spinner.free()
		sprite.free()
		collision_box.free()
		if PlayerNode.get_node("Area2D"):
			PlayerNode._kill_collision()


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.hide()
	await get_tree().create_timer(2).timeout
	ShopNode.show()
	ShopNode.get_node("AudioStreamPlayer").play()
	get_tree().get_root().get_node("Game").get_node("Level 1").queue_free()
