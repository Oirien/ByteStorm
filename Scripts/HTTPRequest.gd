extends HTTPRequest
var http_request

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


#func _submit_score():
#	http_request = HTTPRequest.new()
#	add_child(http_request)
#
#	var data_to_send = {
#		"title": "test1",
#		"date": "2020-1-01 00:00:00",
#		"content": "helloworld",
#		"imageRef": "boobs"
#	}
#	var json = JSON.stringify(data_to_send)
#	var headers = ["Content-Type: application/json"]
#
#	# Call the request() function on the instance of HTTPRequest
#	http_request.request("http://localhost:8080/api/blogpost", headers, HTTPClient.METHOD_POST, json)
