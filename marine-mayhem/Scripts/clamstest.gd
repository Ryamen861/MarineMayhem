extends Control

var currency: float = 0.0  
var rate: float = 1.5  

@onready var label: Label = $Label  

var upgrade_buttons = {}  # Define an empty dictionary

func _ready():
	# Now we initialize the dictionary inside _ready(), after nodes are ready
	upgrade_buttons = {
		"Button": { "button": get_node("Button"), "cost": 50, "multiplier": 2 },
		"Button2": { "button": get_node("Button2"), "cost": 100, "multiplier": 3 },
		"Button3": { "button": get_node("Button3"), "cost": 500, "multiplier": 5 },
		"Button4": { "button": get_node("Button4"), "cost": 2500, "multiplier": 10 }
	}

	# Debugging: Print buttons to check for null values
	for key in upgrade_buttons.keys():
		var button_data = upgrade_buttons[key]
		print("Checking button:", key, "->", button_data["button"])

		# Prevent errors by checking if the button exists
		if button_data["button"]:
			button_data["button"].pressed.connect(_on_upgrade_button_pressed.bind(key))
		else:
			print("ERROR: Button not found for key:", key)

func _process(delta):
	currency += rate * delta  
	label.text = "Clam Currency: " + str(floor(currency))  
	check_button_states()

func check_button_states():
	for key in upgrade_buttons.keys():
		var button_data = upgrade_buttons[key]
		if button_data["button"]:  # Prevent null access errors
			button_data["button"].disabled = currency < button_data["cost"]

func _on_upgrade_button_pressed(button_key):
	var button_data = upgrade_buttons[button_key]
	
	if currency >= button_data["cost"]:
		currency -= button_data["cost"]
		rate *= button_data["multiplier"]
		button_data["button"].disabled = true
		button_data["button"].text = "Upgraded!"
		
		GlobalSignal.cleanup.emit()
