class_name Bottle
extends Node2D

func start() -> void:
	var picture = Sprite2D.new()
	picture.texture = load("res://Assets/bottle.png")
	add_child(picture)

	#var rng = RandomNumberGenerator.new()
	#position.x = rng.randi_range(-280, 280)
	#position.y = rng.randi_range(-180, 180)
	z_index = -5
