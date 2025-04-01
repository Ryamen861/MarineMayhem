extends Node2D

var slope: int

func _ready():	
	var rng = RandomNumberGenerator.new()
	
	var angle =  rng.randf_range(0, 360)
	var facing = rng.randf_range(0, 2)
	
	# compare angle to values of 0 degrees and 180 degrees to figure out how the slopes should go
	
	if angle > 90:
		# flip the fish image
		pass
	
	slope = tan(angle)
	
	self.rotation_degrees = angle
	
	position.x = rng.randf_range(-280, 280)
	position.y = rng.randf_range(-180, 180)

func _process(delta):
	position.x += delta * 60
	position.y += delta * slope * 60
