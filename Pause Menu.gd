extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Popup.hide()
	process_mode = Control.PROCESS_MODE_ALWAYS
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_resume_button_pressed():
	$Popup.hide()
	Engine.time_scale = 1

		
