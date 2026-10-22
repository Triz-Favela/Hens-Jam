extends CharacterBody2D
class_name Weapon

var flipped: bool = false
@export var wallCheck: RayCast2D
@export var fireRate: float = 0.2
var cooldown: float = 0.0
var clicking: bool = false

func click() -> void:
	clicking = true

func releaseClick() -> void:
	clicking = false
