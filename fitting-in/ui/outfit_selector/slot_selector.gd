extends HBoxContainer

@export var type : BaseAccessory.AccessoryType


func _on_left_pressed():
	GameState.player_inventoy.set_accessory(type, 1)	

func _on_right_pressed():
	GameState.player_inventoy.set_accessory(type, -1)	
