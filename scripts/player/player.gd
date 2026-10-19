extends CharacterBody2D
class_name Player

const ACCEL: float = 1200.0
const MAX_RUN_SPEED: float = 230.0
const JUMP_VELOCITY: float = -350.0

@onready var flipGroup: Node2D = get_node("FlipGroup")

var direction: float = 0
var flipped: bool = false:
	set(new_value):
		if new_value == flipped:
			return
		flipped = new_value
		flipGroup.scale.x = -1 if flipped else 1

func _physics_process(_delta: float) -> void:
	
	direction = Input.get_axis("LEFT","RIGHT")
	if direction == -1:
		flipped = true
	elif direction == 1:
		flipped = false
	
	move_and_slide()
