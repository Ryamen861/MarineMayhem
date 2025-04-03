extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobalSignal.connect("Funfact", change_text)
		
func change_text(new_text):
	print('changing')
	text = new_text
