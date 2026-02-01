class_name InventorySlot extends Resource

@export var type : BaseAccessory.AccessoryType
@export var accessories : Array[Accessory]

@export var current : int = -1
	
func set_current(i, rel):
	current = (i + current) if rel else i
	current = posmod(current, accessories.size())
	
func get_current():
	if current < 0 or current >= accessories.size():
		return null
		
	return accessories[current]

func add_item(accessory : Accessory):
	if accessory.get_type() != type:
		return
		
	accessories.append(accessory)
