extends Node2D
class_name CurrentItemManagerEnemy

@export var enemy: Nazi1
@export var animationTree: AnimationTree
#@onready var animStateMachine: AnimationNodeStateMachinePlayback = animationTree.get("parameters/StateMachine/playback")
const BLEND_PATH = "parameters/Blend2/blend_amount"

@export var primaryWeapon: PrimaryWeapon
@export var secondaryWeapon: SecondaryWeapon
@export var throwableWeapon: ThrowableWeapon

@onready var currentWeapon: Weapon = secondaryWeapon
var currentWeaponIndex: int = 2

var lastBlendAmount: int = 1

func changeItem(index: int) -> void:
	if index > 3 or index < 1:
		return
		
	currentWeaponIndex = index
	setCurrentWeapon()

func click() -> void:
	if currentWeapon:
		currentWeapon.click()

func releaseClicking() -> void:
	if currentWeapon:
		currentWeapon.releaseClick()

func throwWeapon() -> void:
	if currentWeapon:
		currentWeapon.call_deferred("reparent", get_tree().current_scene)

func _input(event: InputEvent) -> void:
	#if !currentWeapon:
		#if lastBlendAmount != 0:
			#animationTree.set(BLEND_PATH, 0)
		#lastBlendAmount = 0
		#return
	
	#if lastBlendAmount != 1:
		#animationTree.set(BLEND_PATH, 1)
	#
	#lastBlendAmount = 1
	pass

func setCurrentWeapon():
	if currentWeapon:
		currentWeapon.visible = false
	
	match currentWeaponIndex:
		1:
			currentWeapon = primaryWeapon
		2: 
			currentWeapon = secondaryWeapon
		3:
			currentWeapon = throwableWeapon
	
	if currentWeapon:
		currentWeapon.visible = true
		currentWeapon.flipped = enemy.flipped
