extends CharacterBody2D

const ACCEL: float = 1000.0
const MAX_RUN_SPEED: float = 230.0
const JUMP_VELOCITY: float = -350.0

func _physics_process(_delta: float) -> void:
	if velocity.y > 1000:
		velocity.y = 1000
	 
	if velocity.y < -300:
		velocity.y = -300
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action("SHOOT"):
		if event.is_pressed() and !event.is_echo():
			print("atirou")
		if event.is_released():
			print("soltou")
