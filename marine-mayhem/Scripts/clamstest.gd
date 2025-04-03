extends Control

var currency: float = 0.0
var rate: float = 1.0
var upgrade_cost: float = 50.0 

@onready var label: Label = $Clams
@onready var upgrade_button: Button = $Button

func _ready():
	upgrade_button.pressed.connect(_on_upgrade_button_pressed)

func _process(delta):
	currency += rate * delta
	label.text = "Clams Currency: " + str(int(currency))
	check_button_state()

func check_button_state():
	if currency >= upgrade_cost:
		upgrade_button.disabled = false
	else:
		upgrade_button.disabled = true 



func _on_upgrade_button_pressed():
	if currency >= upgrade_cost:
		currency -= upgrade_cost
		rate *= 2
		upgrade_button.disabled = true
		upgrade_button.text = "Upgraded!"
