extends Node2D

@onready var sprite = $Sprite2D #Get child node from the node this script is attached to
@onready var playerSprite = $"../Sprite2D" #Go to parent node and search for Sprite2D
@onready var gunBarrel = $Marker2D
const BULLET = preload("res://Assets/Scenes/bullet.tscn") #loads something when this script loads


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	if rotation_degrees > 100 and rotation_degrees < 274:
		playerSprite.flip_h = false
		sprite.flip_v = true
		sprite.offset.y = abs(sprite.offset.y) #Can't use scale.y 
		gunBarrel.position.y = abs(gunBarrel.position.y) #Bunch of BS bc I can't use scale.y
	else:
		playerSprite.flip_h = true
		sprite.flip_v = false
		sprite.offset.y = abs(sprite.offset.y) * -1
		gunBarrel.position.y = abs(gunBarrel.position.y) * -1
		
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate() #Creates bullet in memory only
		get_tree().current_scene.add_child(bullet_instance)
		bullet_instance.global_position = gunBarrel.global_position
		bullet_instance.rotation = rotation
