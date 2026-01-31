class_name Accessory extends BaseAccessory

@export var icon : Texture2D

@export var prefab : PackedScene
@export var type : AccessoryType

func get_prefab():
	return prefab

func get_type():
	return type
