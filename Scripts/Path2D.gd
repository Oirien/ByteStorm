extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Generate a random initial Y value within a desired range.
	var random_initial_y = randi_range(-100, 100)  # Adjust the range as needed.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
