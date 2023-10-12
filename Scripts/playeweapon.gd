extends Node2D
var bullet_scene = load("res://Scenes/player_bullet.tscn")
var shooting=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (shooting):
		return
	else:
		shooting = true
		self.position = get_parent().position
		await get_tree().create_timer(0.25).timeout
		spawn_bullet()
		shooting = false
		
func spawn_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = self.position
	bullet.position.x += 25
	bullet.rotation = 1.5
	get_parent().get_parent().add_child(bullet)
