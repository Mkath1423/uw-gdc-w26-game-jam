extends Node2D

@export var stress_rate : float = 10
@export var hat : BaseAccessory
@export var shirt : BaseAccessory
@export var held : BaseAccessory
var randomHat = load("res://outfits/scenes/hat/random_hat.tres")
var randomShirt = load("res://outfits/scenes/shirt/random_shirt.tres")
var randomHeld = load("res://outfits/scenes/held/random_held.tres")

var isPlayerMatching = false

# I need a long line. Editor is being weird.
# Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis Dontmindthis 
func _ready():
	GameState.player_inventory.outfit_changed.connect(_on_player_detect_player_inventory_change)

# All player accessories must match group accessories,
# except for random group accessories
func player_inventory_matches() -> bool:
	if (GameState.player_inventory.hats.get_accessory() != hat
	and hat != randomHat):
		return false
	
	if (GameState.player_inventory.shirts.get_accessory() != shirt
	and shirt != randomShirt):
		return false
	
	if (GameState.player_inventory.helds.get_accessory() != held
	and held != randomHeld):
		return false
	
	return true

func _on_player_detect_player_enter() -> void:
	self.isPlayerMatching = player_inventory_matches()
	if not self.isPlayerMatching:
		GameState.player_stress.set_stressed()

func _on_player_detect_player_inventory_change() -> void:
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
