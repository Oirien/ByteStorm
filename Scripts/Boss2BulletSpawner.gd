extends Node2D
var cross_scene = load("res://Scenes/cross_attack.tscn")
var alt_attack_scene = load("res://Scenes/alternate_attack.tscn")
var firing:bool = false
var firing_mode:int = 0

func _ready():
	$AttackStyleTimer.start(1)



func _process(delta):
#	self.rotate(delta*PI/6)

	if (!firing):
		
		_shoot(firing_mode)
	if (firing_mode==0):
		self.rotation = self.get_parent().get_child(3).rotation
	else:
		self.rotation = 0
	
		

func _shoot(mode):
	match mode:
		0: 
			firing = true
			for i in 5:
				await get_tree().create_timer(0.1).timeout
				_spawn_cross()
				
			await get_tree().create_timer(1).timeout
			for i in 5:
				await get_tree().create_timer(0.1).timeout
				_spawn_cross()
				
			await get_tree().create_timer(0.5).timeout
			firing= false
			
			
		1:
			firing = true
			
			
			
			_spawn_alt()
			await get_tree().create_timer(0.1).timeout
			firing = false
		
		_: pass


func _spawn_cross():
	var cross_attack = cross_scene.instantiate()
	self.get_parent().get_child(3).add_child(cross_attack)

func _spawn_alt():
	var alt_attack = alt_attack_scene.instantiate()
	self.add_child(alt_attack)












func _on_attack_style_timer_timeout():
	if (firing_mode == 0):
		await firing == false
		firing_mode = 1
	else:
		await firing == false
		for n in self.get_child_count()-1:
			self.get_child(1).reparent(self.get_parent())

		firing_mode = 0
	$AttackStyleTimer.start(10)
