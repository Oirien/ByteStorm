extends Control


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
