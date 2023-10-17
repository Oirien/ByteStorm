extends Node2D

var t:float = 0.0
var moving_left:bool = false
var moving_along_path:bool = false
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_along_path:
		t+=delta
		$Level3BossPath2D/Level3BossPathFollow2D.progress = t*100
	if(moving_left):
		self.position += (Vector2.LEFT*speed*delta)
		if (self.position.x < 1920):
			speed -= 1
		if(self.position.x < 1400):
			moving_left = false
			moving_along_path = true


func _on_timer_timeout():
	moving_left = true
	$Timer.queue_free()
