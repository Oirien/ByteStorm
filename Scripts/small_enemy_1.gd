extends Node2D
var health=2
@onready var _animated_explosion = $AnimatedSprite2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var wallarea = get_tree().get_root().get_node("Game").get_child(3).get_node("THE WALL")
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	end_of_path()
	
func on_hit():
	health -= 1
	if (health == 0):
		PlayerDataNode._add_score(5)

		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var spawner = get_child(0)
		var sprite = get_child(1)
		var collision_box = get_child(2)
		spawner.free()
		sprite.free()
		collision_box.free()


func _on_animated_sprite_2d_animation_finished():
#	self.queue_free()
	get_parent().get_parent().get_parent().queue_free()



#func hit_wall():
#	if ($Area2D.overlaps_area(wallarea)):
#		PlayerDataNode._add_score(5)
#		get_parent().get_parent().get_parent().queue_free()

func end_of_path():
	if (get_parent().progress_ratio >= 1):
		get_parent().get_parent().get_parent().queue_free()
