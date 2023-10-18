extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_node("PlayerData")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	$AudioStreamPlayer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

func _reset_shops():
	var upgradeCollection = $Upgrades.get_children()
	for upgrade in upgradeCollection:
		upgrade._reset_upgrade()
		upgrade._display_upgrade()


func _on_next_level_pressed():
	var next_level = PlayerDataNode._next_level()
	match next_level:
		2:
			var level_2 = preload("res://Scenes/level_2.tscn").instantiate()
			get_parent().add_child(level_2)
		3:
			var level_3 = preload("res://Scenes/level_3.tscn").instantiate()
			get_parent().add_child(level_3)
	self.hide()
	$AudioStreamPlayer.stop()
