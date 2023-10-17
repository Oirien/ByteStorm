extends Node
var score = 0
var wallet=0
var max_health = 5
var damage = 1
var speed = 300
var current_level = 1
var player_weapon = 1
@onready var ShopNode = get_tree().get_root().get_node("Game").get_node("Shop")

func _add_score(value):
	score+=value

func _add_credits(value):
	wallet+=value

func _get_score():
	return score

func _reset():
	score = 0
	wallet = 0
	max_health = 5
	damage = 1
	speed = 300
	current_level = 1
	player_weapon = 3
	ShopNode._reset_shops()
	
func _spend_money(cost):
	if (wallet>cost):
		wallet-=cost
		return "Success"
	else:
		return "Not Enough Money"
		
func _get_wallet():
	return wallet

func _get_max_health():
	return max_health
	
func _set_max_health(newMaxHealth):
	max_health = newMaxHealth
	
func _get_damage():
	return damage
	
func _set_damage(amount):
	damage = amount
	
func _get_speed():
	return speed

func _set_speed(newSpeed):
	speed = newSpeed
	
func _get_current_level():
	return current_level

func _reset_current_level():
	current_level = 1

func _next_level():
	current_level += 1
	return current_level

func _get_weapon():
	return player_weapon

func _set_weapon(newWeapon):
	player_weapon = newWeapon
