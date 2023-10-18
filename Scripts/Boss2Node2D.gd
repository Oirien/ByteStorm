extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var ShopNode = get_tree().get_root().get_node("Game").get_node("Shop")

@onready var PlayerNode = get_tree().get_root().get_node("Game").get_node("level_2").get_node("Player")

var health = 500
var score_value = 1000
var credit_value = 250


func _ready():
	_animated_explosion.hide()



func _process(_delta):
	pass

func on_hit(damage):
	health -= damage
	if (health <= 0):
		PlayerDataNode._add_score(score_value)
		PlayerDataNode._add_credits(credit_value)
		$Explosion.play()
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spawner = get_child(0)
		var sprite = get_child(1)
		spawner.queue_free()
		sprite.queue_free()
		if PlayerNode.get_node("Area2D"):
			PlayerNode._kill_collision()


func _on_animated_sprite_2d_animation_finished():


	$AnimatedSprite2D.hide()
	await get_tree().create_timer(2).timeout
	ShopNode.show()
	ShopNode.get_node("AudioStreamPlayer").play()
	get_tree().get_root().get_node("Game").get_node("level_2").queue_free()

