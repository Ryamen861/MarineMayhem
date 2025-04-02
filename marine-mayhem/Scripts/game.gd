extends Node2D

var fish_present = []

func _ready():
	$Timer.start()
	
func spawn():
	var obj = preload("res://Scenes/parrotfish.tscn").instantiate()
	#add_child(obj)
	fish_present.append(obj)
	print('spawned')


func _on_timer_timeout() -> void:
	spawn()
