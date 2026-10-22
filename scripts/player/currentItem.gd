extends Node2D
class_name CurrentItemManager

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var animationTree: AnimationTree = player.get_node("AnimationTree")
@onready var animStateMachine: AnimationNodeStateMachinePlayback = animationTree.get("parameters/StateMachine/playback")
const BLEND_PATH = "parameters/Blend2/blend_amount"

@export var primaryWeapon: PrimaryWeapon
@export var secondaryWeapon: SecondaryWeapon
@export var throwableWeapon: ThrowableWeapon

@onready var currentWeapon: Weapon = secondaryWeapon
var currentWeaponIndex: int = 2

var lastBlendAmount: int = 1

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ITEM_INDEX_DOWN"):
		currentWeaponIndex -= 1
		if currentWeaponIndex < 1:
			currentWeaponIndex = 3
		setCurrentWeapon()
	
	if event.is_action_pressed("ITEM_INDEX_UP"):
		currentWeaponIndex += 1
		if currentWeaponIndex > 3:
			currentWeaponIndex = 1
		setCurrentWeapon()
	
	if !currentWeapon:
		if lastBlendAmount != 0:
			animationTree.set(BLEND_PATH, 0)
		lastBlendAmount = 0
		return
	
	currentWeapon.visible = true
	
	if lastBlendAmount != 1:
		animationTree.set(BLEND_PATH, 1)
	
	lastBlendAmount = 1
	
	
	if event.is_action_pressed("SHOOT"):
		currentWeapon.click()
	if event.is_action_released("SHOOT"):
		currentWeapon.releaseClick()

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
