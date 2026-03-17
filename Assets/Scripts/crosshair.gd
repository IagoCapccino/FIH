extends Sprite2D
@onready var GunRotation = get_parent()


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	rotation_degrees = GunRotation.rotation_degrees * -1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
