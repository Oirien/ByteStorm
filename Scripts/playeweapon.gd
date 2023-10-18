extends Node2D
var bullet_scene = load("res://Scenes/player_bullet.tscn")
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

var shooting=false;
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	damage = PlayerDataNode._get_damage()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (shooting):
		return
	else:
		match PlayerDataNode._get_weapon():
			1:
				bullet_pattern1()
			2:
				bullet_pattern2()
			3:
				bullet_pattern3()
				$PlayerWeapon3.play()

func spawn_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = self.position
	bullet.position.x += 25
	bullet.rotation = self.rotation
#	bullet.rotation_degrees -= 90
	get_parent().get_parent().add_child(bullet)
	
func bullet_pattern1():
	shooting = true
	self.position = get_parent().position
	spawn_bullet()
	$PlayerWeapon1.play()
	await get_tree().create_timer(0.25).timeout
	shooting = false

func bullet_pattern2():
	shooting = true
	self.position = get_parent().position
	self.position.y +=12
	spawn_bullet()
	$PlayerWeapon2.play()
	await get_tree().create_timer(0.125).timeout
	self.position = get_parent().position
	self.position.y -=12
	spawn_bullet()
	$PlayerWeapon2.play()
	await get_tree().create_timer(0.125).timeout
	shooting = false

func bullet_pattern3():
	shooting = true
	self.position= get_parent().position
	self.rotation_degrees = 0
	spawn_bullet()
	self.rotation_degrees +=5
	spawn_bullet()
	self.rotation_degrees -=10
	spawn_bullet()
	await get_tree().create_timer(0.25).timeout
	shooting = false
