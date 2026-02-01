class_name PlayerInventory extends Resource

signal inventory_updated
signal outfit_changed

@export var hats : InventorySlot
@export var shirts : InventorySlot
@export var helds : InventorySlot

func get_accessory(type):
	match type:
		BaseAccessory.AccessoryType.Hat:
			return hats.get_current()
		BaseAccessory.AccessoryType.Shirt:
			return shirts.get_current()
		BaseAccessory.AccessoryType.Held:
			return helds.get_current()
		_: 
			return null

func set_accessory(type, idx):
	match type:
		BaseAccessory.AccessoryType.Hat:
			hats.set_current(idx, true)
		BaseAccessory.AccessoryType.Shirt:
			shirts.set_current(idx, true)
		BaseAccessory.AccessoryType.Held:
			helds.set_current(idx, true)
		_: 
			return
	
	outfit_changed.emit()

func add_item(accessory : Accessory):
	match accessory.get_type():
		BaseAccessory.AccessoryType.Hat:
			hats.add_item(accessory) 
		BaseAccessory.AccessoryType.Shirt:
			shirts.add_item(accessory)
		BaseAccessory.AccessoryType.Held:
			helds.add_item(accessory)
		_: 
			return
			
	inventory_updated.emit()
