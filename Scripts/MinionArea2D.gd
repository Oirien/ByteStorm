extends Area2D
var bullet_scene = load("res://Scenes/cross_attack_minion.tscn")
var just_shot:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !just_shot:
		just_shot = true
		_shooting()
		await get_tree().create_timer(3).timeout
		just_shot = false
	end_of_path()


func _shooting():
	var bullet = bullet_scene.instantiate()
	self.add_child(bullet)
	bullet.rotation = 0
	bullet.reparent(get_tree().get_root().get_node("Game"))

func end_of_path():
	if (get_parent().get_parent().progress_ratio >= 1):
		get_parent().get_parent().get_parent().get_parent().queue_free()
