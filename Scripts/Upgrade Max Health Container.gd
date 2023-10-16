extends PanelContainer
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
#BELOW CODE IS FOR TESTING - DELETE BELOW LINE + THE PlayerData NODE WITHIN SHOP SCENE WHEN TESTING IS DONE
#@onready var PlayerDataNode = get_tree().get_root().get_node("Shop").get_node("PlayerData")
var healthUpgrades = [
	{
		"health": 6,
		"price": 100
	},
	{
		"health": 7,
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
	if (currentUpgrade >= healthUpgrades.size()):
		upgradeStatLabel.append_text("[center]Health: Maxed[/center]")
		upgradePriceLabel.append_text("[center]No More Upgrades")
		$HBoxContainer/VBoxContainer/Purchase.hide()
		return 
	upgradeStatLabel.append_text("[center]Health: %s" % [healthUpgrades[currentUpgrade].health])
	upgradePriceLabel.append_text("[center]Price: %s" % [healthUpgrades[currentUpgrade].price])


func _on_purchase_pressed():
	var walletAmount = PlayerDataNode._get_wallet()
	var upgrade = healthUpgrades[currentUpgrade]
	if (walletAmount >= upgrade.price):
		currentUpgrade += 1
		PlayerDataNode._spend_money(upgrade.price)
		PlayerDataNode._set_health(upgrade.health)
		_display_upgrade()
