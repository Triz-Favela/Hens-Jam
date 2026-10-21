extends EnemyState

@export_group("States")
@export var idle: EnemyState

func process_physics(delta: float) -> State:
	enemy.velocity.y += gravity * delta
	
	if enemy.is_on_floor():
		return get_parent().previous_state
	
	return null
