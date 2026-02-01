extends Node2D

var levels : Array[PackedScene] = [
	load("res://levels/level0/level0.tscn")
]


@export var level_parent : Node 

var current_level = 0

func _ready():
	GameState.reset()
	load_current_level()
	GameState.player_stress.stress_limit_reached.connect(_on_player_detect_stress_limit_reached)


func load_current_level():
	for c in level_parent.get_children():
		c.queue_free()

	level_parent.add_child(levels[current_level].instantiate())


func next_level():
	current_level += 1
	if current_level == levels.size():
		SceneManager.swap_screen(SceneManager.Screen.End)

	else:
		load_current_level()

func _on_player_detect_stress_limit_reached():
	load_current_level()
	GameState.reset()
