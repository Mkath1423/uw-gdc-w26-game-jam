extends CharacterBody2D

@export var base_speed : float = 200
@export var accel : float = 1
@export var stopping : float = 1


@export var person : Person

func _ready() -> void:
	GameState.player_stress.stress_updated.connect(on_stress_changed)
	GameState.player_inventory.outfit_changed.connect(on_outfit_changed)

func _physics_process(delta: float) -> void:
	var input_dir = Vector2(
		Input.get_axis("left", "right"), 
		Input.get_axis("up", "down")).normalized()

	var move_by = accel
	if input_dir.length_squared() < 0.01 * 0.01:
		move_by = stopping
		
	velocity = velocity.move_toward(input_dir * base_speed, move_by * delta)

	print_debug(input_dir, velocity)

	move_and_slide()

func set_outfit():
	person.set_accessory(
		GameState.player_inventory.hats.get_current())
	
	person.set_accessory(
		GameState.player_inventory.shirts.get_current())
	
	person.set_accessory(
		GameState.player_inventory.helds.get_current())

func on_stress_changed():
	print_debug("STRESSED %d" % GameState.stress) 

func on_outfit_changed():
	print_debug("TODO: CHANGE THE OUTFIT")
