extends Node2D

func _on_texture_button_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Start)
