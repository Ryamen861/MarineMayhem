extends Sprite2D

signal flipfish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.flipfish.connect(flip)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func flip():
	flip_h = true
