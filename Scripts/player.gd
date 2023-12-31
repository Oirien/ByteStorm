extends Node2D
@onready var _animated_explosion = $AnimatedSprite2D
@onready var _dodge_particles = $CPUParticles2D
@onready var deathpopup = get_parent().get_node("DeathPopup")
@onready var _player_data = get_parent().get_parent().get_node("PlayerData")
@onready var sprite = $Sprite2D
@onready var dashbar = $DashBar
signal _health_decreased
var tween : Tween
@onready var timer = $Timer

var health = 100
var speed = 300
var recently_hit : bool = false
var recently_dodged : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_explosion.hide()
	health = _player_data._get_max_health()
	speed = _player_data._get_speed()
	$Sprite2D.material.set_shader_parameter("active", false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += movement(delta)
	dash_timer()
	
func flash_on_hit():
	var flash_material: ShaderMaterial = $Sprite2D.material
	for flash in range(3):
		flash_material.set_shader_parameter("active", true)
		await get_tree().create_timer(0.1).timeout
		flash_material.set_shader_parameter("active", false)
		await get_tree().create_timer(0.1).timeout

func on_hit(_damage):
	if recently_hit == false:
		$PlayerDamage.play()
		flash_on_hit()
		recently_hit = true
		health -= 1
		if health > 0:
			await get_tree().create_timer(0.5).timeout
		recently_hit = false
		_health_decreased.emit()

	if (health == 0):
		
		_kill_collision()
		_animated_explosion.show()
		_animated_explosion.reparent(self)
		_animated_explosion.play("explosion")
		$PlayerDeath.play()
		sprite.free()
		

func dash_timer():
	var timeleft : float = timer.time_left / 3
	if timeleft:
		tween = create_tween()
		tween.tween_property(dashbar, "scale", Vector2(1.0, timeleft), 0.1)

func movement(delta):
	if (health > 0):
		var xDirection = 0
		var yDirection = 0
		var dodge_speed = 1
		if (Input.is_action_just_pressed("ui_dodge")):
			if recently_dodged == false:
				_on_dodge()
				_dodge_timer()
				dodge_speed = 15
				_dodge_particles.emitting = true
		if (Input.is_action_pressed("ui_down")):
			yDirection = speed * dodge_speed
		if (Input.is_action_pressed("ui_up")):
			yDirection = -speed * dodge_speed
		if (Input.is_action_pressed("ui_right")):
			xDirection = speed * dodge_speed
		if (Input.is_action_pressed("ui_left")):
			xDirection = -speed * 1.5 * dodge_speed
		return Vector2(xDirection, yDirection) *delta
	return Vector2.ZERO

func _on_player_area_bottom_area_entered(_area):
	self.position.y -= 24


func _on_player_area_top_area_entered(_area):
	self.position.y += 24


func _on_player_area_left_area_entered(_area):
	self.position.x += 24


func _on_player_area_right_area_entered(_area):
	self.position.x -= 24


func _on_animated_sprite_2d_animation_finished():
	deathpopup.show()
	self.queue_free()

func _on_dodge():
	recently_hit = true
	$Dash.play()
	await get_tree().create_timer(.5).timeout
	recently_hit = false
	
func _dodge_timer():
	recently_dodged = true
	timer.start()
	await timer.timeout
	timer.stop()
	recently_dodged = false

func _get_health():
	return self.health
	
func _kill_collision():
	$Area2D.queue_free()
