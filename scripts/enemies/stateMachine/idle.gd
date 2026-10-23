extends EnemyState

@export_group("States")
@export var patrol: EnemyState
@export var attacking: EnemyState

var idleTimer: float = 5

func enter() -> void:
	animStateMachine.travel("idle")
	enemy.velocity.x = 0
	idleTimer = randf_range(6, 8)

func process_frame(delta: float) -> State:
	idleTimer -= delta
	if idleTimer <= 0:
		return patrol
	return null

func process_physics(delta: float) -> State:
	enemy.velocity.y += gravity * delta
	
	if enemy.playerSeen:
		return null
		#return attacking
	
	return null

func exit() -> void:
	pass
