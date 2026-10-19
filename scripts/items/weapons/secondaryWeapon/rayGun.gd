extends SecondaryWeapon
class_name RayGun

const projectile: PackedScene = preload("res://scenes/weapons/projectile.tscn")
const PROJECTILE_VELOCITY: float = 1000.0

func click() -> void:
	var instance = projectile.instantiate()
	instance.global_position = $Marker2D.global_position
	instance.velocity.x = PROJECTILE_VELOCITY * (-1 if flipped else 1)
	get_tree().current_scene.call_deferred("add_child", instance)
