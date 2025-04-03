class_name Parrotfish
extends Node2D

var rng = RandomNumberGenerator.new()
var Xrate: int = rng.randi_range(20, 40) * [-1, 1][rng.randi_range(0,1)]
var Yrate: int = rng.randi_range(20, 40) * [-1, 1][rng.randi_range(0,1)]
var deltaSum: float = 0.0

func start():
	var picture = Sprite2D.new()
	picture.texture = load("res://.godot/imported/parrotfish.png-3a60f15094200c501c6f3f5c8d65a901.ctex")
	add_child(picture)
	
	if Xrate > 0:
		picture.flip_h = true
		# GlobalSignal.flipfish.emit() # communicate to bus, "we need to flip the fish"
		position.x = -350
	else:
		position.x = 350
	position.y = rng.randf_range(-150, 150)
	
	var scalefactor = rng.randf_range(1, 2)
	scale = Vector2(scalefactor, scalefactor)
	

func _process(delta):
	position.x += (delta * Xrate)
	position.y += (delta * sin(deltaSum) * 20)
	deltaSum += delta
	z_index = -4
