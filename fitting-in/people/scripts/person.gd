class_name Person extends Node2D

@export var head_anchor : Node2D
@export var hair_anchor : Node2D
@export var hat_anchor : Node2D

@export var shirt_anchor : Node2D
@export var hold_anchor : Node2D

@export var animation_player : AnimationPlayer

func _replace(anchor : Node2D, with : PackedScene):
	for c in anchor.get_children():
		c.queue_free()

	anchor.add_child(with.instantiate())
	
func set_accessory(accessory : BaseAccessory):
	match accessory.get_type():
		BaseAccessory.AccessoryType.Hair:
			_replace(hair_anchor, accessory.get_prefab())

		BaseAccessory.AccessoryType.Hat:
			_replace(hat_anchor, accessory.get_prefab())

		BaseAccessory.AccessoryType.Shirt:
			_replace(shirt_anchor, accessory.get_prefab())

		BaseAccessory.AccessoryType.Held:
			_replace(hold_anchor, accessory.get_prefab())
		_:
			pass

func set_animation_walking():
	animation_player.play("walk")
	animation_player.speed_scale = 4

func set_animation_idle():
	animation_player.play("idle")

func clear_animation():
	animation_player.stop()
