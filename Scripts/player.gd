extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var xDirection = 0
	var yDirection = 0
	
	if (Input.is_action_pressed("ui_down")):
		yDirection = 2
	if (Input.is_action_pressed("ui_up")):
		yDirection = -2
	if (Input.is_action_pressed("ui_right")):
		xDirection = 2
	if (Input.is_action_pressed("ui_left")):
		xDirection = -2
	self.position += Vector2(xDirection, yDirection)
