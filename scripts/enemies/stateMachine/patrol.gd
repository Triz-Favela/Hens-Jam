extends EnemyState


@export_group("States")
@export var idle: EnemyState
@export var attacking: EnemyState
@export var air: EnemyState

var patrolTimer: float = 5.0

func enter() -> void:
	enemy.direction = -enemy.direction
	patrolTimer = randf_range(4, 6)
	enemy.velocity.x = enemy.direction * enemy.MAX_RUN_SPEED/4
	
func process_frame(_delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	enemy.velocity.y += gravity * delta
	patrolTimer -= delta
	
	if enemy.playerSeen:
		return null
		#return attacking
	
	if !enemy.is_on_floor():
		return air
	
	if patrolTimer <= 0:
		return idle
	
	if !floorCheck.is_colliding():
		return idle
	
	
	return null
