extends CharacterBody2D
class_name Projectile

func _ready() -> void:
	get_node("Area2D").connect("body_entered", on_body_entered)

func _physics_process(_delta: float) -> void:
	move_and_slide()

func on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_damage"):
		body.handle_dagame(20)
