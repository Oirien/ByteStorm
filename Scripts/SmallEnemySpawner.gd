extends Node2D

var recently_spawned = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (get_children().size() < 5):
		var enemy_child = preload("res://Scenes/small_enemy_scene.tscn").instantiate()
		if recently_spawned:
			return
		else:
			recently_spawned = true
			self.add_child(enemy_child)
			await get_tree().create_timer(1).timeout
			recently_spawned = false
		
