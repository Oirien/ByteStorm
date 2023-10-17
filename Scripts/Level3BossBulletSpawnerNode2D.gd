extends Node2D
var boss_2_bullet = load("res://Scenes/boss_2_bullet.tscn")
var laser_load = load("res://Scenes/laser.tscn")
var shooting:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.time_scale = 3
	if allowed_to_shoot(self.global_position.x):
		_laser()


func _shoot():
	pass

func _tail_shot():
	for n in 3:
		_spawn_spread(n)
	await get_tree().create_timer(1).timeout

func _laser():
	shooting = true
	self.get_parent().get_node("CPUParticles2D").show()
	await get_tree().create_timer(2).timeout
	self.get_parent().get_node("CPUParticles2D").hide()
	_laser_spawn()
	await get_tree().create_timer(20).timeout
	shooting = false
	
func _wings():
	shooting = true
	for n in 5:
		_wing_shot(n)
		await get_tree().create_timer(0.3).timeout
	shooting = false
	
func _apocalypse():
	pass

func _laser_spawn():
	var laser = laser_load.instantiate()
	
	self.add_child(laser)
	laser.rotate(PI/2)
	laser.position += Vector2(0, -250)
	
	pass

func allowed_to_shoot(xCoord):
	if(xCoord >1400):
		return false
	if shooting:
		return false
	else:
		return true


func _spawn_spread(n):
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

func _wing_shot(n):
	var offset1:Vector2
	var offset2:Vector2
	
	match n:
		0:
			pass
		1:
			offset1=Vector2(70,-60)
			offset2=Vector2(70, 60)
		2:
			offset1=Vector2(140,-65)
			offset2=Vector2(140, 65)
		3:
			offset1=Vector2(210, -105)
			offset2=Vector2(210, 105)
		4:
			offset1=Vector2(280,-125)
			offset2=Vector2(280, 125)
		_:pass
	
	
	var bullet = boss_2_bullet.instantiate()
	var bullet2 = boss_2_bullet.instantiate()
	
	bullet.position = self.global_position + Vector2(-370, -35)+offset1
	bullet2.position = self.global_position + Vector2(-370, 35)+offset2
	
	
	self.get_parent().get_node("bulletHost").add_child(bullet)
	self.get_parent().get_node("bulletHost").add_child(bullet2)
	
	bullet.rotation += (-0.05 + (0.05*n))
	bullet2.rotation += (0.05 + (0.05*n))
	
	await get_tree().create_timer(1).timeout

