extends Node2D

var health = 5
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += movement(delta)

func on_hit():
	health -= 1
	if (health == 0):
		self.queue_free()
	
func movement(delta):
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





func _on_player_area_bottom_area_entered(area):
	self.position.y -= 24


func _on_player_area_top_area_entered(area):
	self.position.y += 24


func _on_player_area_left_area_entered(area):
	self.position.x += 24


func _on_player_area_right_area_entered(area):
	self.position.x -= 24
