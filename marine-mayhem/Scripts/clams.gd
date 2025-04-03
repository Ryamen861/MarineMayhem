extends Control

var currency: float = 0.0  
var rate: float = 1.5  

@onready var label: Label = $Label  

@onready var upgrade_buttons := {
	"Button": { "button": $Upgrade1, "cost": 50, "multiplier": 2 },
	"Button2": { "button": $Upgrade2, "cost": 100, "multiplier": 3 },
	"Button3": { "button": $Upgrade3, "cost": 200, "multiplier": 5 },
	"Button4": { "button": $Upgrade4, "cost": 500, "multiplier": 10 }
}

func _ready():
	for key in upgrade_buttons.keys():
		var button_data = upgrade_buttons[key]
		button_data["button"].pressed.connect(func(): _on_upgrade_button_pressed(key))
		
	check_button_states()

func _process(delta):
	currency += rate * delta  
	label.text = "Currency: " + str(floor(currency))  
	check_button_states()

func check_button_states():
	for key in upgrade_buttons.keys():
		var button_data = upgrade_buttons[key]
		button_data["button"].disabled = currency < button_data["cost"]

func _on_upgrade_button_pressed(button_key):
	var button_data = upgrade_buttons[button_key]
	
	if currency >= button_data["cost"]:
		currency -= button_data["cost"]
		rate *= button_data["multiplier"]
		button_data["button"].disabled = true
		button_data["button"].text = "Upgraded!"
