extends CharacterBody2D
class_name Nazi1

const ACCEL: float = 1200.0
const MAX_RUN_SPEED: float = 200.0
const JUMP_VELOCITY: float = -300.0

@export var flipGroup: Node2D
@export var playerCheck: Area2D

var direction: int = 1:
	set(new_value):
		direction = new_value
		if direction == 1:
			flipped = true
		elif direction == -1:
			flipped = false

var flipped: bool = false:
	set(new_value):
		if new_value == flipped:
			return
		flipped = new_value
		flipGroup.scale.x = -1 if flipped else 1

var playerSeen: bool = false

func _ready() -> void:
	playerCheck.connect("body_entered", player_entered)
	playerCheck.connect("body_exited", player_exited)

func player_exited(body: Node2D) -> void:
	if body is not Player:
		return
	else:
		playerSeen = false

func player_entered(body: Node2D) -> void:
	if body is not Player:
		return
	else:
		playerSeen = true

func _physics_process(delta: float) -> void:
	move_and_slide()
