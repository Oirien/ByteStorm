extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var player_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_menu_pressed():
	var gamescene = get_node("../../")
	gamescene.get_child(0).show()
	gamescene.get_child(3).queue_free()

#Once we fix the submit score we can uncomment line 25
func _on_submit_score_pressed():
	var score = PlayerDataNode._get_score()
#	$HTTPRequest._submit_score()
	var gamescene = get_node("../../")
	gamescene.get_child(0).show()
	gamescene.get_child(3).queue_free()


func _on_text_edit_text_changed():
	player_name = $VBoxContainer/TextEdit.text
