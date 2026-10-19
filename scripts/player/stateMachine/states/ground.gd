extends PlayerState

@export_group("States")
@export var air: PlayerState

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	
	if player.direction:
		animStateMachine.travel("running")
		player.velocity.x = player.direction * player.MAX_RUN_SPEED
	else:
		animStateMachine.travel("idle")
		player.velocity.x *= 0.2
	
	if player.is_on_floor() and Input.is_action_just_pressed("UP"):
		player.velocity.y = player.JUMP_VELOCITY
	
	if !player.is_on_floor():
		if player.velocity.y < 0:
			animStateMachine.travel("jumping")
		else:
			animStateMachine.travel("landing")
		return air
	
	return null
