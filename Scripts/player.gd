extends Node2D

var health = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement()

func on_hit():
	health -= 1
	if (health == 0):
		self.queue_free()
	
func movement():
	var xDirection = 0
	var yDirection = 0
	
	if (Input.is_action_pressed("ui_down")):
		yDirection = 3
	if (Input.is_action_pressed("ui_up")):
		yDirection = -3
	if (Input.is_action_pressed("ui_right")):
		xDirection = 3
	if (Input.is_action_pressed("ui_left")):
		xDirection = -3
	self.position += Vector2(xDirection, yDirection)





func _on_player_area_bottom_area_entered(area):
	self.position.y -= 50


func _on_player_area_top_area_entered(area):
	self.position.y += 50


func _on_player_area_left_area_entered(area):
	self.position.x += 50


func _on_player_area_right_area_entered(area):
	self.position.x -= 50
