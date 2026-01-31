class_name _GameState extends Node

var player_stress : PlayerStress = load("res://state/player_stress.tres")
var player_inventory : PlayerInventory = load("res://state/player_inventory.tres")

signal state_reset

func reset():
	state_reset.emit()
