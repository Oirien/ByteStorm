extends Control
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var player_name = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_menu_pressed():
	var gamescene = get_node("../../")
	gamescene.get_child(0).show()
	gamescene.get_child(4).queue_free()
	gamescene.get_node("MainMenu").get_node("AudioStreamPlayer").play()


func _on_submit_score_pressed():
	var score = PlayerDataNode._get_score()
	if player_name != "":
		$HTTPRequest._submit_score(player_name, score)
		self.hide()
		await get_tree().create_timer(3).timeout
	var gamescene = get_node("../../")
	_on_menu_pressed()


func _on_text_edit_text_changed():
	player_name = $VBoxContainer/TextEdit.text

