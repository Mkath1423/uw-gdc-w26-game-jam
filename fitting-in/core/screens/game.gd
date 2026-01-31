extends Node2D

var levels : Array[PackedScene] = [
	load("res://levels/testing/testing.tscn")
]


var current_level = 0

func _ready():
	GameState.reset()
	load_current_level()


func load_current_level():
	for c in get_children():
		c.queue_free()

	add_child(levels[current_level].instantiate())


func next_level():
	current_level += 1
	if current_level == levels.size():
		SceneManager.swap_screen(SceneManager.Screen.End)

	else:
		load_current_level()
