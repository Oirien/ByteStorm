extends Node2D
var cross_scene = load("res://Scenes/cross_attack.tscn")
var firing = false
var firing_mode = 0

func _ready():
	pass



func _process(delta):
	self.rotate(delta*PI/6)
	if (!firing):
		_shoot(firing_mode)

func _shoot(mode):
	match mode:
		0: 
			firing = true
			for i in 5:
				_spawn_cross()
				await get_tree().create_timer(0.1).timeout
			await get_tree().create_timer(1).timeout
			for i in 5:
				_spawn_cross()
				await get_tree().create_timer(0.1).timeout
			await get_tree().create_timer(0.5).timeout
			firing= false
			
		_: pass


func _spawn_cross():
	var cross_attack_test = cross_scene.instantiate()
	self.add_child(cross_attack_test)
