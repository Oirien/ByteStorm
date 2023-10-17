extends Node2D
var boss_2_bullet = load("res://Scenes/boss_2_bullet.tscn")
var shooting:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if allowed_to_shoot(self.global_position.x):
		_tail_shot()


func _shoot():
	pass

func _tail_shot():
	for n in 3:
		spawn_spread(n)
	await get_tree().create_timer(1).timeout

func _laser():
	pass
	
func _wings():
	pass
	
func _apocalypse():
	pass



func allowed_to_shoot(xCoord):
	if(xCoord >1400):
		return false
	if shooting:
		return false
	else:
		return true


func spawn_spread(n):
	shooting = true
	var bullet = boss_2_bullet.instantiate()
	var bullet2 = boss_2_bullet.instantiate()
	var bullet3 = boss_2_bullet.instantiate()
	var bullet4 = boss_2_bullet.instantiate()
	
	
	
	bullet.position = self.global_position
	bullet2.position = self.global_position + Vector2(90,0)
	bullet3.position = self.global_position + Vector2(180,0)
	bullet4.position = self.global_position + Vector2(270,0)
	
	
	
	bullet.rotation += (-0.05 + (0.05*n))
	bullet2.rotation += (-0.15 + (0.15*n))
	bullet3.rotation += (-0.25 + (0.25*n))
	bullet4.rotation += (-0.35 + (0.35*n))
	
	
	
	self.get_parent().get_node("bulletHost").add_child(bullet)
	self.get_parent().get_node("bulletHost").add_child(bullet2)
	self.get_parent().get_node("bulletHost").add_child(bullet3)
	self.get_parent().get_node("bulletHost").add_child(bullet4)
	
	
	
	await get_tree().create_timer(1).timeout
	shooting = false
