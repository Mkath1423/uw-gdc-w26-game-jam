extends Node2D

signal entered_win_zone

func _on_player_detect_player_enter() -> void:
	entered_win_zone.emit()
