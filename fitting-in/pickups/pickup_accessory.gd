extends Node2D

@export var accessory : Accessory

func _on_player_detect_player_enter() -> void:
	GameState.player_inventory.add_item(accessory)
	queue_free()
