extends Area2D

signal player_enter
signal player_exit

@export var is_player_in : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_in = true

	player_enter.emit()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_in = false

	player_exit.emit()
