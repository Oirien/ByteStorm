extends Node
var score = 0
var wallet=0
var max_health = 5
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _add_score(value):
	
	score+=value
	wallet+=value*5
	
func _get_score():
	return score

func _reset():
	score=0
	wallet=0
	max_health=5
	damage=1
	
func _spend_money(cost):
	if (wallet>cost):
		wallet-=cost
		return "Success"
	else:
		return "Not Enough Money"
		
func _get_wallet():
	return wallet
