extends Node2D


func _on_back_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Start)


func _on_got_it_pressed() -> void:
	SceneManager.swap_screen(SceneManager.Screen.Start)
