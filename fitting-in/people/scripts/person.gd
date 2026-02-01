class_name Person extends Node2D


@export var neck : Line2D

@export var animation_player : AnimationPlayer

@onready var hair_front : Sprite2D = $visuals/head_front/hair_front
@onready var hair_back : Sprite2D = $visuals/head_back/hair_back
@onready var shirt : Sprite2D = $visuals/body/shirt
@onready var held : Sprite2D = $visuals/body/held
@onready var head : Sprite2D = $visuals/head_front/head
@onready var hat : Sprite2D = $visuals/head_front/hat

@onready var head_front : Node2D = $visuals/head_front
@onready var head_back : Node2D = $visuals/head_back

func set_accessory(acc: Accessory):
	if acc == null:
		return
	
	acc.apply_accessory(self)

func set_animation_walking():
	animation_player.play("walk")
	animation_player.speed_scale = 4

func set_animation_idle():
	animation_player.play("idle")

func clear_animation():
	animation_player.stop()
	
func _process(_delta):
	head_back.position = head_front.position
	head_back.rotation = head_front.rotation

	
