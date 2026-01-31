extends CharacterBody2D

@export var base_speed : float = 200
@export var accel : float = 1
@export var stopping : float = 1

func _ready() -> void:
    GameState.stress_updated.connect(on_stress_changed)

func _physics_process(delta: float) -> void:
    var input_dir = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()

    var move_by = accel
    if input_dir.length_squared() < 0.01 * 0.01:
        move_by = stopping
        
    velocity = velocity.move_toward(input_dir * base_speed, move_by * delta)

    print_debug(input_dir, velocity)

    move_and_slide()

func on_stress_changed():
    print_debug("STRESSED %d" % GameState.stress) 