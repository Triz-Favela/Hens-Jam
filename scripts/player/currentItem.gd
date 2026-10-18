extends Node

@export var primaryWeapon: PrimaryWeapon
@export var secondaryWeapon: SecondaryWeapon
@export var throwableWeapon: ThrowableWeapon

var currentWeaponIndex: int = 1
var currentWeapon: Weapon = primaryWeapon

var shooting: bool = false

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
	
	
	if event.is_action_pressed("SHOOT"):
		currentWeapon.click()
	if event.is_action_released("SHOOT"):
		currentWeapon.releaseClick()

func setCurrentWeapon():
	match currentWeaponIndex:
		1:
			currentWeapon = primaryWeapon
		2: 
			currentWeapon = secondaryWeapon
		3:
			currentWeapon = throwableWeapon
