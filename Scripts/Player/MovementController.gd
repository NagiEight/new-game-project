extends CharacterBody2D

const SPEED = 500
const GRAVITY = 1200
const JUMP_FORCE = -500
const JUMP_HOLD_TIME = .3
const EXTRA_GRAVITY = 2000

var jump_time = 0.0
var is_jumping = false

func _physics_process(delta):
	var MoveDirection = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
	velocity.x = MoveDirection * SPEED
	
	if not is_on_floor():
		if is_jumping and Input.is_action_pressed("Jump") and jump_time < JUMP_HOLD_TIME:
			jump_time += delta  # Light gravity while holding jump
		else:
			velocity.y += EXTRA_GRAVITY * delta  # Fast fall
			is_jumping = false
	else:
		velocity.y = 0
		jump_time = 0
		is_jumping = false

	# Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jumping = true
	
	move_and_slide()
