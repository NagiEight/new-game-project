extends CharacterBody2D

var speed = 500
var gravity = 400

func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	velocity.y += gravity * delta  # Apply gravity

	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity.x = input.x * speed

	move_and_slide()
