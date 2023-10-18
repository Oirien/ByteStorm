extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var _animated_logo = $AnimatedSprite2D
var recently_animated : bool = true;
var start_pressed : bool = false;
@onready var animation_timer = $AnimatedSprite2D/Timer

func _ready():
	pass
	
	
func _process(_delta):
	_animation_spread()
	
func _animation_spread():
	if recently_animated == true:
		var generatedtime : float = randf_range(3.0,7.0)
		recently_animated = false
		animation_timer.wait_time = generatedtime
		animation_timer.start()
		await animation_timer.timeout
		_play_animation()

func _on_start_pressed():
	if start_pressed == false:
		start_pressed = true
		_animated_logo.apply_scale(Vector2(2,2))
		_animated_logo.play("glitch_heavy")
		await _animated_logo.animation_finished

		var level_1 = preload("res://Scenes/level_1.tscn").instantiate()

		get_parent().add_child(level_1)
		PlayerDataNode._reset()
		self.hide()
		_animated_logo.apply_scale(Vector2(.5,.5))
		_animated_logo.play("default")
		$AudioStreamPlayer.stop()
		start_pressed = false

func _play_animation():
	var animation_target = randi_range(1,2)
	if recently_animated == false:
		if animation_target == 1:
			_animated_logo.play("glitch_1")
			await _animated_logo.animation_finished
			if !start_pressed:
				_animated_logo.play("default")
			recently_animated = true
			return
		if animation_target == 2:
			_animated_logo.play("glitch_2")
			await _animated_logo.animation_finished
			if !start_pressed:
				_animated_logo.play("default")
			recently_animated = true
			return
			

func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	self.hide()
	var gamescene = get_node("../")
	gamescene.get_child(2).show()
