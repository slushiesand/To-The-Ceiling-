class_name Player extends CharacterBody2D

var coyote_frames = 2
var is_coyote = false
#obviously, you're a ceiling. but you can be a coyote as a treat. same kingdom anyway.
var last_floor = false
var jumping = false
var double_jump = false

const SPEED = 200
const JUMP_VELOCITY = -700.0

func _ready() -> void:
	$Timer.wait_time = coyote_frames / 60.0

func _physics_process(delta: float) -> void:
	last_floor = is_on_floor()

	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumping = false
		double_jump = false
	
	#https://kidscancode.org/godot_recipes/4.x/2d/coyote_time/index.html
	if Input.is_action_just_pressed("up"):
		
		if (is_on_floor() or is_coyote):
			velocity.y = JUMP_VELOCITY
			$Buble.play()
			jumping = true
			double_jump = true
		elif double_jump == true:
			velocity.y = -600.0
			$Buble.play()
			double_jump = false
		else:
			pass
	
	if not is_on_floor() and not jumping:
		is_coyote = true
		$Timer.start()

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("left"):
		$Sprite2D.set_flip_h(true)
	elif Input.is_action_pressed("right"):
		$Sprite2D.set_flip_h(false)
		
	move_and_slide()

func _on_timer_timeout() -> void:
	is_coyote = false
	#you are now a ceiling.
