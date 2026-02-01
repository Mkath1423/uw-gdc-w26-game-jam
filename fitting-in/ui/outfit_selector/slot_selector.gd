extends Control

@export var type : BaseAccessory.AccessoryType

@export var pos_action : String
@export var neg_action : String

@onready var icon : TextureRect = $slot_selector/MarginContainer/panel/CenterContainer/TextureRect

func _ready():
	GameState.player_inventory.outfit_changed.connect(on_outfit_change)
	on_outfit_change()
	

func _process(_delta):
	if Input.is_action_just_pressed(pos_action):
		_on_right_pressed()
		
	if Input.is_action_just_pressed(neg_action):
		_on_left_pressed()


func on_outfit_change():
	var res = GameState.player_inventory.get_accessory(type)
	if res == null:
		icon.texture = null
		return
		
	icon.texture = res.icon

func _on_left_pressed():
	GameState.player_inventory.set_accessory(type, 1)	

func _on_right_pressed():
	GameState.player_inventory.set_accessory(type, -1)	
