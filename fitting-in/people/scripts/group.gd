extends Node2D

@export var stress_rate : float = 10

@export var hat : Accessory
@export var shirt : Accessory
@export var held : Accessory

@export var people : Node 

var isPlayerMatching = false
var isPlayerIn = false

# I need a long line. Editor is being weird.
# Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis 
func _ready():
	GameState.player_inventory.outfit_changed.connect(_on_player_detect_player_inventory_change)

	for c in people.get_children():
		if c is Person:
			c.set_accessory(hat)
			c.set_accessory(shirt)
			c.set_accessory(held)

# All player accessories must match group accessories,
# except for random group accessories
func player_inventory_matches() -> bool:
	if (hat != null and GameState.player_inventory.hats.get_current() != hat):
		return false
	
	if (shirt != null and GameState.player_inventory.shirts.get_current() != shirt):
		return false
	
	if (held != null and GameState.player_inventory.helds.get_current() != held):
		return false
	
	return true

func _on_player_detect_player_enter() -> void:
	self.isPlayerMatching = player_inventory_matches()
	isPlayerIn = true
	if not self.isPlayerMatching:
		GameState.player_stress.set_stressed()

func _on_player_detect_player_inventory_change() -> void:
	if not isPlayerIn:
		return
		
	var wasPlayerPreviouslyMatching = self.isPlayerMatching
	self.isPlayerMatching = player_inventory_matches()
	# No change in matching, no updates needed.
	if wasPlayerPreviouslyMatching == self.isPlayerMatching:
		return
	
	if self.isPlayerMatching:
		# Call the increase player stress method
		GameState.player_stress.unset_stressed()
	else:
		GameState.player_stress.set_stressed()
		

func _on_player_detect_player_exit() -> void:
	self.isPlayerMatching = player_inventory_matches()

	if not self.isPlayerMatching:
		# Call the increase player stress method
		GameState.player_stress.unset_stressed()
	
	isPlayerIn = false
