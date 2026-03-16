extends CharacterBody2D

@export var speed : float = 200.0

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	if direction == Vector2(1, 0):
		$Sprite2D.flip_h = true
	
	if direction == Vector2(-1, 0):
		$Sprite2D.flip_h = false
	move_and_slide()
