extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var bullet_scene = load("res://Scenes/mini_boss_bullet.tscn")
var bullet_scene2 = load("res://Scenes/boss_2_bullet.tscn")
var health = 50
var score_value = 500
var credit_value = 100
var shooting:bool = false
var attack_style:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackStyleTimer.start(randf_range(0.1,7.0))
	_animated_explosion.hide()
	
func on_hit(damage):
	health -= damage
	if (health <= 0):
		
		PlayerDataNode._add_score(score_value)
		PlayerDataNode._add_credits(credit_value)
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var area = $Area2D
		area.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	match attack_style:
		0:self.rotate(get_angle_to(self.get_parent().get_child(3).position) + PI/2)
		1:self.rotation = -PI/2
		_:pass
	
	if (!shooting && health >0):
		match attack_style:
			0:
				spawn_bullet()
			1:
				for n in 3:
					spawn_spread(n)
				await get_tree().create_timer(0.3).timeout
			_:pass
	
	
	

func spawn_bullet():
	shooting = true
	var bullet = bullet_scene.instantiate()
	bullet.position = self.global_position
	self.get_parent().get_node("bulletHost").add_child(bullet)
	await get_tree().create_timer(0.5).timeout
	shooting = false

func spawn_spread(n):
	shooting = true
	var bullet2 = bullet_scene2.instantiate()
	bullet2.position = self.global_position
	bullet2.rotation += (-0.15 + (0.15*n))
	self.get_parent().get_node("bulletHost").add_child(bullet2)
	await get_tree().create_timer(0.5).timeout
	shooting = false




func _on_animated_sprite_2d_animation_finished():
	self.queue_free()


func _on_attack_style_timer_timeout():
	match attack_style:
		0:
			await shooting == false
			attack_style = 1
		1:
			await shooting == false
			attack_style = 0
		_:pass
	$AttackStyleTimer.start(randf_range(0.1,7.0)) 
