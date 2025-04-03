extends Control

@onready var shop_ui: Control = $ShopControl

func _ready():
	shop_ui.visible = !shop_ui.visible

func _input(event):
	if event.is_action_pressed("Shop"):
		shop_ui.visible = !shop_ui.visible
