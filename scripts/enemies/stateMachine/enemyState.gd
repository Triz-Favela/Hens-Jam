extends State
class_name EnemyState

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@export var enemy: Nazi1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
