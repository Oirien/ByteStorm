extends PanelContainer
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_node("PlayerData")
var damageUpgrades = [
	{
		"damage": 2,
		"price": 100
	},
	{
		"damage": 4,
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
	if (currentUpgrade >= damageUpgrades.size()):
		upgradeStatLabel.append_text("[center]Damage: Maxed[/center]")
		upgradePriceLabel.append_text("[center]No More Upgrades")
		$HBoxContainer/VBoxContainer/Purchase.hide()
		return 
	upgradeStatLabel.append_text("[center]Damage: %s" % [damageUpgrades[currentUpgrade].damage])
	upgradePriceLabel.append_text("[center]Price: %s" % [damageUpgrades[currentUpgrade].price])


func _on_purchase_pressed():
	var walletAmount = PlayerDataNode._get_wallet()
	var upgrade = damageUpgrades[currentUpgrade]
	if (walletAmount >= upgrade.price):
		currentUpgrade += 1
		PlayerDataNode._spend_money(upgrade.price)
		PlayerDataNode._set_damage(upgrade.damage)
		_display_upgrade()

func _reset_upgrade():
	currentUpgrade = 0
	$HBoxContainer/VBoxContainer/Purchase.show()
