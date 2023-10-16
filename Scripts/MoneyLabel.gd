extends RichTextLabel
#@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
#BELOW CODE IS FOR TESTING - DELETE BELOW LINE + THE PlayerData NODE WITHIN SHOP SCENE WHEN TESTING IS DONE
@onready var PlayerDataNode = get_tree().get_root().get_node("Shop").get_node("PlayerData")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.clear()
	self.add_text("Credits: " + str(PlayerDataNode._get_wallet()))
