class_name Accessory extends BaseAccessory

@export var icon : Texture2D

@export var hair_back : Texture2D
@export var hair_front : Texture2D
@export var hat : Texture2D
@export var shirt : Texture2D
@export var held : Texture2D

@export var type : AccessoryType

func apply_accessory(p : Person):
	if type == BaseAccessory.AccessoryType.Outfit or \
		type == BaseAccessory.AccessoryType.Hair: 
		p.hair_back.texture = hair_back
		p.hair_front.texture = hair_front
		
	if type == BaseAccessory.AccessoryType.Outfit or \
		type == BaseAccessory.AccessoryType.Held: 
		p.held.texture = held
		
		
	if type == BaseAccessory.AccessoryType.Outfit or \
		type == BaseAccessory.AccessoryType.Shirt: 
		p.shirt.texture = shirt
		
	if type == BaseAccessory.AccessoryType.Outfit or \
		type == BaseAccessory.AccessoryType.Hat: 
		p.hat.texture = hat

func get_type():
	return type
