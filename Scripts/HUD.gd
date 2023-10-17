extends Control
var tween : Tween
@onready var healthBar : ColorRect = $ColorRect
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

func _ready():
	var player_info = get_tree().get_root().get_node("Game").get_child(4).get_node("Player")
	player_info.connect("_health_decreased", _health_lost)

func _health_lost():
	var player_max_health : float = PlayerDataNode._get_max_health()
	var player_health : float = get_tree().get_root().get_node("Game").get_child(4).get_node("Player")._get_health()
	var percent_health : float = player_health / player_max_health
	tween = create_tween()
	tween.tween_property(healthBar, "scale", Vector2(percent_health,1), 0.5)
	tween.parallel().tween_property(healthBar, "color", Color.WHITE, 0.5)
	tween.chain().tween_property(healthBar, "color", Color.RED, 0.1)
