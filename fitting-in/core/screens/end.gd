extends Node2D

func _ready():
	end_game()
	
func end_game():
	get_tree().quit()
