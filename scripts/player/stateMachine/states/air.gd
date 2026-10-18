extends PlayerState

@export_group("States")
@export var ground: PlayerState
@export var jetpacking: PlayerState

var jump_buffer:float = 0.1
var jump_timer:float = 1
var coyote_time:float = 0.15
var jetpack_cooldown: float = 0.5

func enter() -> void:
	jump_timer = 1
	coyote_time = 0.15

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	jump_timer -= delta
	jump_buffer -= delta
	coyote_time -= delta
	jetpack_cooldown -= delta
	
	var direction: float = Input.get_axis("LEFT","RIGHT")
	if direction:
		player.velocity.x += player.ACCEL * delta * direction
		if abs(player.velocity.x) > player.MAX_RUN_SPEED:
			player.velocity.x = direction * player.MAX_RUN_SPEED
	else:
		player.velocity.x *= 0.9
	
	if Input.is_action_pressed("UP") and jump_timer > 0:
		player.velocity.y += player.JUMP_VELOCITY * delta
	
	if Input.is_action_just_pressed("UP"):
		if jetpack_cooldown <= 0:
			return jetpacking
		else:
			jump_buffer = 0.1
	
	if Input.is_action_just_released("UP"):
		jump_timer = 0
	
	if player.is_on_floor():
		if jump_buffer > 0:
			player.velocity.y = player.JUMP_VELOCITY
			return self
		else:
			return ground
	
	return null
