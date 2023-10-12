extends RichTextLabel
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.append_text(str(PlayerDataNode._get_score()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
