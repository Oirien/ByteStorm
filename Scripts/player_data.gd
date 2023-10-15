extends Node
var score = 0
var wallet=1000
var max_health = 5
var damage = 1

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
	
func _get_damage():
	return damage
	
func _set_damage(amount):
	damage = amount
