extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _flip():
	var vel:Vector2 = velocity
	if (vel.x > 0.001 and scale.y < 0) or (vel.x < -0.001 and scale.y > 0):
		rotate(PI)
		apply_scale(Vector2(1,-1))
func _physics_process(delta: float) -> void:
	if GameManager.game_state != GameEnum.GameState.Gaming:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("back", "forward")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_flip()

	move_and_slide()
