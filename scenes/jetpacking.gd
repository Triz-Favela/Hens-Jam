extends PlayerState

@export_group("States")
@export var air: PlayerState
@export var ground: PlayerState

func process_physics(delta: float) -> State:
	jetpack.useJetpack(delta)
	
	var direction: float = Input.get_axis("LEFT","RIGHT")
	if direction:
		player.velocity.x += player.ACCEL * delta * direction
		if abs(player.velocity.x) > player.MAX_RUN_SPEED:
			player.velocity.x = direction * player.MAX_RUN_SPEED
	else:
		player.velocity.x *= 0.5
	
	if Input.is_action_just_released("UP") or jetpack.jetpackFuel <= 0:
		return air
	
	if player.is_on_floor():
		return ground
	
	return null
