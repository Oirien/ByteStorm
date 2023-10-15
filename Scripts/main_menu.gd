extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
@onready var _animated_logo = $AnimatedSprite2D
var recently_animated : bool = true;
var start_pressed : bool = false;

func _ready():
	pass
	
	
func _process(_delta):
	_animation_spread()
	
func _animation_spread():
	if recently_animated == true:
		await get_tree().create_timer(5.0).timeout
		recently_animated = false
		_play_animation()

func _on_start_pressed():
	if start_pressed == false:
		start_pressed = true
		_animated_logo.play("glitch_heavy")
		await _animated_logo.animation_finished
		var level_1 = preload("res://Scenes/level_1.tscn").instantiate()
		get_parent().add_child(level_1)
		PlayerDataNode._reset()
		self.hide()
		$AudioStreamPlayer.stop()
		start_pressed = false

func _play_animation():
	var animation_target = randi_range(1,2)
	if recently_animated == false:
		if animation_target == 1:
			_animated_logo.play("glitch_1")
			await _animated_logo.animation_finished
			_animated_logo.play("default")
			recently_animated = true
			return
		if animation_target == 2:
			_animated_logo.play("glitch_2")
			await _animated_logo.animation_finished
			_animated_logo.play("default")
			recently_animated = true
			return
			

func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	self.hide()
	var gamescene = get_node("../")
	gamescene.get_child(2).show()
