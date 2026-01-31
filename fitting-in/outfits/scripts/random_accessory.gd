class_name RandomAccessory extends BaseAccessory

@export var prefabs : Array[PackedScene]
@export var type : AccessoryType

func get_prefab():
	return prefabs.pick_random()

func get_type():
	return type
