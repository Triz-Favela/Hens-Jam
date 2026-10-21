extends EnemyState


@export_group("States")
@export var idle: EnemyState

var direction: int = 1
var patrolTimer: float = 5.0

func enter() -> void:
	direction = -direction
	patrolTimer = randf_range(4, 6)
	enemy.velocity.x = direction * enemy.MAX_RUN_SPEED/4

func process_frame(_delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	enemy.velocity.y += gravity * delta
	patrolTimer -= delta
	if patrolTimer <= 0:
		return idle
	
	if enemy.is_on_floor():
		return null
	
	return null

func exit() -> void:
	pass
