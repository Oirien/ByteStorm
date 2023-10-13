extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var deathpopup = get_parent().get_node("DeathPopup")
var health = 5
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += movement(delta)
	
func on_hit():
	health -= 1
	if (health == 0):
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		var sprite = get_child(0)
		var collision_box = get_child(1)
		sprite.free()
		collision_box.free()
	
func movement(delta):
	if (health > 0):
		var xDirection = 0
		var yDirection = 0
	
		if (Input.is_action_pressed("ui_down")):
			yDirection = speed
		if (Input.is_action_pressed("ui_up")):
			yDirection = -speed
		if (Input.is_action_pressed("ui_right")):
			xDirection = speed
		if (Input.is_action_pressed("ui_left")):
			xDirection = -speed
		return Vector2(xDirection, yDirection) *delta
	return Vector2.ZERO

func _on_player_area_bottom_area_entered(area):
	self.position.y -= 24


func _on_player_area_top_area_entered(area):
	self.position.y += 24


func _on_player_area_left_area_entered(area):
	self.position.x += 24


func _on_player_area_right_area_entered(area):
	self.position.x -= 24


func _on_animated_sprite_2d_animation_finished():
	deathpopup.show()
	self.queue_free()


func _on_player_area_top_area_exited(area):
	pass # Replace with function body.
