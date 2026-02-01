extends Node

signal level_over

func _on_win_zone_entered_win_zone() -> void:
	level_over.emit()
