class_name _GameState extends Node

var stress : float = 0
var max_stress : float = 100

var sem_is_stressed : int = 0

signal stress_updated
signal stress_limit_reached

signal state_reset

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

func reset():
    stress = 0
    max_stress = 100

    state_reset.emit()
