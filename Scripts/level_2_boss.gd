extends Node2D


var t:float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	$L2BossPath2D/L2BossPathFollow2D.progress = t * 100
