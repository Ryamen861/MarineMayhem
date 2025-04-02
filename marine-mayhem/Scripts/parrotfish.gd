extends Node2D

var angle: float

var Xrate: float
var Yrate: float

var deltaSum: float

func _ready():
	var rng = RandomNumberGenerator.new()
	
	# var parrotfish_node = get_node("ParrotfishNode")
	# parrotfish_node.connect("flipfish", flip)
	
	Xrate = [-40, 40][rng.randi_range(0, 1)]
	Yrate = [-40, 40][rng.randi_range(0, 1)]
	
	if Xrate > 0:
		GlobalSignal.flipfish.emit() # communicate to bus, "we need to flip the fish"
		position.x = -350
	else:
		position.x = 350
	position.y = rng.randf_range(-150, 150)
	
	var scalefactor = rng.randf_range(1, 2)
	self.scale = Vector2(scalefactor, scalefactor)

func _process(delta):
	position.x += delta * Xrate
	position.y += delta * sin(deltaSum) * 20
	deltaSum += delta
	z_index = 3
	
