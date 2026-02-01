class_name OutfitSelector extends Control

@export var panel : Control

func _input(event):
	if event.is_action_pressed("open_outfit_select"):
		panel.visible = not panel.visible
	
