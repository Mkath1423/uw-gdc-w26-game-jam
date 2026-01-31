class_name _GameState extends Node

var stress : float = 0
var max_stress : float = 100

signal stress_updated
signal stress_limit_reached

func add_stress(amount : float):
    stress += amount

    stress_updated.emit()
    
    if stress > max_stress:
        stress_limit_reached.emit()
