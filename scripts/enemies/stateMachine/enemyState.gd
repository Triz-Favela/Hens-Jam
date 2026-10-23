extends State
class_name EnemyState

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@export var enemy: Nazi1
@export var playerCheck: Area2D
@export var floorCheck: RayCast2D
@export var currentItemManager: CurrentItemManagerEnemy
@export var animationTree: AnimationTree
@onready var animStateMachine: AnimationNodeStateMachinePlayback = animationTree.get("parameters/StateMachine/playback") if animationTree else null


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
