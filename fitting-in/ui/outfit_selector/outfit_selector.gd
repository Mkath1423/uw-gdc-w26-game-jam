class_name OutfitSelector extends Control

@export var panel : Control
func _input(event):
	if event.is_action_pressed("open_outfit_select"):
		panel.visible = true
		
		
	if event.is_action_released("open_outfit_select"):
		panel.visible = false
