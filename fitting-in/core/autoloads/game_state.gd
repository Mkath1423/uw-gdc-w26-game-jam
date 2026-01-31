class_name _GameState extends Node

var stress : float = 0
var max_stress : float = 100

signal stress_updated
signal stress_limit_reached

signal state_reset

func add_stress(amount : float):
    stress += amount

    stress_updated.emit()
    
    if stress > max_stress:
        stress_limit_reached.emit()

func reset():
    stress = 0
    max_stress = 100

    state_reset.emit()

