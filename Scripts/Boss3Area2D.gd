extends Area2D
var hideStarted:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (self.global_position.x <=1400 && hideStarted == false):
		$Timer.start(10)
		hideStarted = true


func _on_timer_timeout():
	if (!self.is_visible()):
		if(self.global_position.x <= 1400):
			self.show()
		$Timer.start(10)
		return
	if (self.is_visible()):
		if(self.global_position.x <= 1400):
			self.hide()
		$Timer.start(5)
		return
	else:
		$Timer.start(10)
