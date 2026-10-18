extends Node

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

const JETPACK_REFUEL_RATE: float = 10.0
const JETPACK_USE_RATE: float = 1.0
var JETPACK_VELOCITY: float = -gravity


var jetpackFuelCooldown: float = 0.0
var jetpackFuel: float = 100.0:
	set(new_value):
		if new_value < jetpackFuel:
			jetpackFuelCooldown = 2.0
		jetpackFuel = new_value

func useJetpack(delta) -> void:
	if jetpackFuel > 0:
		player.velocity.y += JETPACK_VELOCITY * delta
		jetpackFuel -= JETPACK_USE_RATE
		jetpackFuel = max(jetpackFuel, 0)

func _process(delta: float) -> void:
	if jetpackFuelCooldown > 0:
		jetpackFuelCooldown -= delta
	elif jetpackFuel < 100:
		jetpackFuel += JETPACK_REFUEL_RATE * delta
		jetpackFuel = min(jetpackFuel, 100)
