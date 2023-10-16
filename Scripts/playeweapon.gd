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
