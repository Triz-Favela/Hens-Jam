extends CharacterBody2D
class_name Nazi1

const ACCEL: float = 1200.0
const MAX_RUN_SPEED: float = 200.0
const JUMP_VELOCITY: float = -300.0

func _physics_process(delta: float) -> void:
	move_and_slide()
