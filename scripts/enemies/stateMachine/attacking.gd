extends EnemyState

@export_group("States")
@export var air: EnemyState

func _ready() -> void:
	pass

func enter() -> void:
	pass

func process_frame(delta: float) -> State:
	
	return null

func process_physics(delta: float) -> State:
	enemy.velocity.y += gravity * delta
	
	if !enemy.is_on_floor():
		return air
	
	if !enemy.playerSeen:
		return null
	
	currentItemManager.look_at(player.global_position)
	
	
	return null

func exit() -> void:
	pass
