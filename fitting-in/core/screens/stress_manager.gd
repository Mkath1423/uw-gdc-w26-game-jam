extends Node

@export var stress_inc_rate = 30
@export var stress_dec_rate = 15


func _process(delta: float) -> void:
	var amount = stress_inc_rate if GameState.player_stress.is_stressed() else -stress_dec_rate
	amount *= delta

	GameState.player_stress.add_stress(amount)
