extends CharacterBody2D


const SPEED = 250
const JUMP_VELOCITY = -900.0


func _physics_process(delta: float) -> void:
	var tween = get_tree().create_tween().set_ease(Tween.EASE_IN)

	if not is_on_floor():
		tween.pause()
		velocity += get_gravity() * delta
	else:
		#scale = Vector2(1, 0.7)
		tween.tween_property($Sprite2D, "scale:y", 1.0, 0.5)
		
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		tween.pause()
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("left"):
		$Sprite2D.set_flip_h(true)
	elif Input.is_action_pressed("right"):
		$Sprite2D.set_flip_h(false)
		
	
		

	move_and_slide()
