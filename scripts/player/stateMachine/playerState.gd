extends State
class_name PlayerState

@onready var player:CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var jetpack: Node = player.get_node("Jetpack")
@onready var animationTree: AnimationTree = player.get_node("AnimationTree")
@onready var animStateMachine: AnimationNodeStateMachinePlayback = animationTree.get("parameters/StateMachine/playback")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
