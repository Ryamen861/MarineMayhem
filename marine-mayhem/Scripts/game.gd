extends Node2D


@export var spawn_object = preload("res://Scenes/parrotfish.tscn")

func _ready():
	var fish_present = []
	spawn()
	
func spawn():
	var obj = spawn_object.instantiate()
	obj.position = Vector2(-180, 30)
	add_child(obj)
