extends Node2D
var boss_2_bullet = load("res://Scenes/boss_2_bullet.tscn")
var laser_load = load("res://Scenes/laser.tscn")
var shooting:bool = false
var firing_mode:int = 0
var apocalypse_on:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if allowed_to_shoot(self.global_position.x):
		_shoot(delta)


func _shoot(delta):
	match firing_mode:
		0:
			_wings(5)
			firing_mode = randi_range(0,3)
		1:
			_tail_shot(randi_range(4,8))
			firing_mode = randi_range(0,3)
		2:
			_laser(delta)
			firing_mode = randi_range(0,3)
		3:
			_apocalypse(delta)
			firing_mode = randi_range(0,3)
			shooting = false
		_:
			pass

func _tail_shot(repeats):
	for i in repeats:
		for n in 3:
			_spawn_spread(n)
		await get_tree().create_timer(1).timeout

func _laser(delta):
	shooting = true
	self.get_parent().get_node("CPUParticles2D").show()
	$laserCharging.play
	await get_tree().create_timer(1.6).timeout
	self.get_parent().get_node("CPUParticles2D").hide()
	$laserFiring.play()
	await _laser_spawn()
	await _laser_wipe_top_to_bottom(delta)
	await _laser_wipe_bottom_to_top(delta)
	_laser_wipe_top_to_bottom(delta)
	await _laser_wipe_bottom_to_top(delta)
	$laserFiring.stop()
	shooting = false
	
func _wings(repeats):
	shooting = true
	for i in repeats:
		for n in 5:
			_wing_shot(n)
			await get_tree().create_timer(0.3).timeout
	shooting = false
	
func _apocalypse(delta):
	apocalypse_on = true
	_wings(12)
	_tail_shot(20)
	await _laser(delta)
	apocalypse_on = false

func _laser_spawn():
	var laser = laser_load.instantiate()
	
	self.add_child(laser)
	laser.rotate(PI/2)
	laser.position += Vector2(0, -250)
	await get_tree().create_timer(5).timeout
	laser.queue_free()

func _laser_wipe_top_to_bottom(delta):
	var rotated_by:float = 0.0
	var laser = laser_load.instantiate()
	self.add_child(laser)
	laser.rotate(PI-PI/6)
	laser.position += Vector2(0, -250)
	while(laser.rotation > PI/6):
		laser.rotate(-rotated_by)
		rotated_by += delta/60
		await get_tree().create_timer(0.03).timeout
	laser.queue_free()
	
func _laser_wipe_bottom_to_top(delta):
	var rotated_by:float = 0.0
	var laser = laser_load.instantiate()
	self.add_child(laser)
	laser.rotate(PI/6)
	laser.position += Vector2(0, -250)
	while(laser.rotation < PI-PI/6):
		laser.rotate(-rotated_by)
		rotated_by -= delta/60
		await get_tree().create_timer(0.03).timeout
	laser.queue_free()





func allowed_to_shoot(xCoord):
	if(xCoord >1400):
		return false
	if shooting:
		return false
	if apocalypse_on:
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

