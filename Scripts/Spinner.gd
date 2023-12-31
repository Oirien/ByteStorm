extends Node2D
var bullet_scene = load("res://Scenes/boss_bullet.tscn")
var shooting=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var shootLeft = 0.06
var shootRight = -0.06
var previousRotation = 0
var currentDirection = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	bullet_pattern1()
	
	

func spawn_bullet():
	var bullet = bullet_scene.instantiate()
	var base_node = get_node("../../../../../")
	bullet.rotation = self.rotation
	base_node.add_child(bullet)
	bullet.position = get_parent().get_parent().position
	
	
func bullet_pattern1():
	var currentRotationValue = self.rotation
	if (currentRotationValue > 0.5):
		currentDirection = shootRight
	if (currentRotationValue < -0.5):
		currentDirection = shootLeft
	self.rotate(currentDirection)
	
	if (shooting):
		return
	else:
		shooting = true
		self.position = get_parent().position
		await get_tree().create_timer(0.08).timeout
		spawn_bullet()
		shooting = false
	previousRotation = currentRotationValue
