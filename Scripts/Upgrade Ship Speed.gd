extends PanelContainer
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
#BELOW CODE IS FOR TESTING - DELETE BELOW LINE + THE PlayerData NODE WITHIN SHOP SCENE WHEN TESTING IS DONE
#@onready var PlayerDataNode = get_tree().get_root().get_node("Shop").get_node("PlayerData")
var speedUpgrades = [
	{
		"speed": 400,
		"price": 100
	},
	{
		"speed": 600,
		"price": 400
	}
]
var currentUpgrade = 0
@onready var upgradeStatLabel = $HBoxContainer/VBoxContainer/UpgradeStat
@onready var upgradePriceLabel = $HBoxContainer/VBoxContainer/Price


# Called when the node enters the scene tree for the first time.
func _ready():
	_display_upgrade()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _display_upgrade():
	upgradeStatLabel.clear()
	upgradePriceLabel.clear()
	if (currentUpgrade >= speedUpgrades.size()):
		upgradeStatLabel.append_text("[center]Damage: Maxed[/center]")
		upgradePriceLabel.append_text("[center]No More Upgrades")
		$HBoxContainer/VBoxContainer/Purchase.hide()
		return 
	upgradeStatLabel.append_text("[center]Speed: %s" % [speedUpgrades[currentUpgrade].speed])
	upgradePriceLabel.append_text("[center]Price: %s" % [speedUpgrades[currentUpgrade].price])


func _on_purchase_pressed():
	var walletAmount = PlayerDataNode._get_wallet()
	var upgrade = speedUpgrades[currentUpgrade]
	if (walletAmount >= upgrade.price):
		currentUpgrade += 1
		PlayerDataNode._spend_money(upgrade.price)
		PlayerDataNode._set_speed(upgrade.speed)
		_display_upgrade()

func _reset_upgrade():
	currentUpgrade = 0
