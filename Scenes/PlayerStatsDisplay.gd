extends RichTextLabel
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	self.clear()
	self.append_text("[center]Score: " + str(PlayerDataNode._get_score()) + "[/center]")
