extends EnemyState


@export_group("States")
@export var example: EnemyState

var idleTimer: float = 5

func enter() -> void:
	pass

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func exit() -> void:
	pass
