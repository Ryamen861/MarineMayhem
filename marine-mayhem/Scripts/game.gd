extends Node2D

#@onready var NewNode = preload("res://Scripts/NewNode.gd")

var all_fish = []
var all_bottles = []
var rng = RandomNumberGenerator.new()

#@onready var label = $Label

func _ready() -> void:
			
	for i in range(0, 11):
		var new_bottle = Bottle.new()
		new_bottle.start()
		new_bottle.position.x = find_x()
		new_bottle. position.y = find_y()
		add_child(new_bottle)
		all_bottles.append(new_bottle)
		
	
func find_x():
	var found_match = false
	var x: int
	while !found_match:
		x = rng.randi_range(-280, 280)
		for bottle in all_bottles:
			if (bottle.position.x - 40) < x and x < (bottle.position.x + 40):
				break
		found_match = true
	return x
	
func find_y():
	var found_match = false
	var y: int
	while !found_match:
		y = rng.randi_range(-180, 180)
		for bottle in all_bottles:
			if (bottle.position.y - 70) < y and y < (bottle.position.y + 70):
				break
		found_match = true
	return y

func _on_timer_timeout() -> void:
	var Fish = Parrotfish.new()
	Fish.start()
	add_child(Fish)
	#all_fish.append(Fish)
	#print(all_fish)
	#for i in all_fish:
		#print(i.position.x)
	
func _on_timer_2_timeout():
	var file = FileAccess.open("res://Scripts/facts.txt", FileAccess.READ)
	var text_list = file.get_as_text().split("\n")
	print('sending signal')
	GlobalSignal.Funfact.emit(text_list[RandomNumberGenerator.new().randi_range(0, 99)])
