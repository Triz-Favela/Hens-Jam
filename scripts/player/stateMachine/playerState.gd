extends State
class_name PlayerState

@onready var player:CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var jetpack: Node = player.get_node("Jetpack")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
