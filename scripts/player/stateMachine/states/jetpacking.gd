extends PlayerState

@export_group("States")
@export var air: PlayerState
@export var ground: PlayerState

func process_physics(delta: float) -> State:
	jetpack.useJetpack(delta)
	
	if player.velocity.y < -300:
		player.velocity.y = -300
	
	if player.direction:
		player.velocity.x += player.ACCEL * delta * player.direction
		if abs(player.velocity.x) > player.MAX_RUN_SPEED:
			player.velocity.x = player.direction * player.MAX_RUN_SPEED
	else:
		player.velocity.x *= 0.5
	
	if Input.is_action_just_released("UP") or jetpack.jetpackFuel <= 0:
		return air
	
	if player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY
		return air
	
	return null
