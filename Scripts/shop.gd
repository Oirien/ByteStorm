extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

func _reset_shops():
	var upgradeCollection = $Upgrades.get_children()
	for upgrade in upgradeCollection:
		upgrade._reset_upgrade()


func _on_next_level_pressed():
	pass # Replace with function body.
#	var level_1 = preload("res://Scenes/level_1.tscn").instantiate()
#	get_parent().add_child(level_1)
