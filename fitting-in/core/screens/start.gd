extends Node2D

func _on_button_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Game)


func _on_credits_button_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.End)


func _on_controls_button_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Controls)
