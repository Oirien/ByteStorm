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


func _on_line_edit_text_changed(new_text):
	player_name = $VBoxContainer/LineEdit.text


func _on_http_request_completed(result, response_code, headers, body):
	_on_menu_pressed()
