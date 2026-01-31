class_name PlayerStress extends Resource

@export var stress : float = 0
@export var max_stress : float = 100

var sem_is_stressed : int = 0

signal stress_updated
signal stress_limit_reached

func add_stress(amount : float):
	stress += amount

	stress_updated.emit()
	
	if stress > max_stress:
		stress_limit_reached.emit()

	stress = clamp(stress, 0, INF)

func set_stressed():
	sem_is_stressed += 1
	stress_updated.emit()

func unset_stressed():
	sem_is_stressed -= 1
	stress_updated.emit()

func is_stressed():
	return sem_is_stressed > 0
