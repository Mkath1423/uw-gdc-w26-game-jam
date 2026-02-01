extends Node2D

func _on_button_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Game)
