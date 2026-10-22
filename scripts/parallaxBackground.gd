extends ParallaxBackground

const MAX_OFFSET = -200

func _process(delta: float) -> void:
	get_node("Ashes1").motion_offset.x = get_node("Ashes1").motion_offset.x + delta * -15 if get_node("Ashes1").motion_offset.x > MAX_OFFSET else 0
	get_node("Ashes2").motion_offset.x = get_node("Ashes2").motion_offset.x + delta * -10 if get_node("Ashes2").motion_offset.x > MAX_OFFSET else 0
