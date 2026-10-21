extends State
class_name EnemyState

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@export var enemy: Nazi1
@export var playerCheck: Area2D
@export var floorCheck: RayCast2D
@export var currentItemManager: CurrentItemManagerEnemy

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
