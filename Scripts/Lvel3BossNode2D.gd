extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var laser_warning = $CPUParticles2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var WinNode = get_tree().get_root().get_node("Game").get_node("level_3").get_node("win_popup")
@onready var DeathNode = get_tree().get_root().get_node("Game").get_node("level_3").get_node("DeathPopup")
@onready var Player = get_tree().get_root().get_node("Game").get_node("level_3").get_node("Player")

var health = 3000
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
		$Explosion.play()
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spawner = get_node("Level3BossBulletSpawnerNode2D")
		var sprite = get_node("Sprite2D")
		var hitbox = get_node("Boss3Area2D")
		if Player.get_node("Area2D"):
			Player.get_node("Area2D").queue_free()
		hitbox.queue_free()
		spawner.queue_free()
		sprite.queue_free()

func _on_animated_sprite_2d_animation_finished():
	print("I'm an asshole")
	WinNode.show()
	DeathNode.hide()
