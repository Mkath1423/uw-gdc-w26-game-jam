extends HBoxContainer

@export var type : BaseAccessory.AccessoryType

@export var icon : TextureRect

func _ready():
	GameState.player_inventory.outfit_changed.connect(on_outfit_change)

func on_outfit_change():
	
	pass

func _on_left_pressed():
	GameState.player_inventory.set_accessory(type, 1)	

func _on_right_pressed():
	GameState.player_inventory.set_accessory(type, -1)	
