extends PrimaryWeapon
class_name ChargeGun

var chargeAmount: float = 0
var charging: bool = false

func click() -> void:
	chargeAmount = 0
	charging = true

func _process(delta: float) -> void:
	if !charging:
		return
	
	chargeAmount += delta
	chargeAmount = min(chargeAmount, 5)

func releaseClick() -> void:
	charging = false
	print(chargeAmount)
