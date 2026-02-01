extends Node2D

var levels : Array[PackedScene] = [
	load("res://levels/level0/level0.tscn"),
	load("res://levels/level0/level1.tscn"),
	load("res://levels/level0/level2.tscn"),
	load("res://levels/level0/level3.tscn")
]


@export var level_parent : Node 

var current_level = 0

var backup_inventory = null

func _ready():
	GameState.reset()
	load_current_level()
	GameState.player_stress.stress_limit_reached.connect(_on_player_detect_stress_limit_reached)
	save_inventory()


func save_inventory():
	backup_inventory = GameState.player_inventory.duplicate(true)

func restore_inventory():
	if backup_inventory == null:
		return

	GameState.player_inventory.hats = backup_inventory.hats.duplicate()
	GameState.player_inventory.shirts = backup_inventory.shirts.duplicate()
	GameState.player_inventory.helds = backup_inventory.helds.duplicate()


func load_current_level_impl():
	for c in level_parent.get_children():
		c.queue_free()
	
	var new_level = levels[current_level].instantiate()
	level_parent.add_child(new_level)
	new_level.level_over.connect(next_level)
	# restore_inventory()

func load_current_level():
	call_deferred("load_current_level_impl")


func next_level():
	current_level += 1
	if current_level == levels.size():
		SceneManager.swap_screen(SceneManager.Screen.End)

	else:
		 # save_inventory()
		load_current_level()

func _on_player_detect_stress_limit_reached():
	load_current_level()
	GameState.reset()
