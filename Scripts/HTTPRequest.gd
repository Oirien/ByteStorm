extends HTTPRequest
var http_request
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)

func _submit_score(player_name, score):
	http_request = HTTPRequest.new()
	http_request.request_completed.connect(get_parent()._on_http_request_completed)
	add_child(http_request)

	var data_to_send = {
		"name": player_name,
		"score": score
	}
	
	var json = JSON.stringify(data_to_send)
	var headers = ["Content-Type: application/json"]

	# Call the request() function on the instance of HTTPRequest
	http_request.request("http://54.74.199.55:8080/api/leaderboard/", headers, HTTPClient.METHOD_POST, json)
