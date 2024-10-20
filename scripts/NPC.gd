class_name NPC
extends CharacterBody2D

var enable = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if GameManager.game_state != GameEnum.GameState.Gaming:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _ready() -> void:
	%Area2D.body_entered.connect(func(body:Node2D):
		if not enable:
			return
		enable = false
		GameEventBus.start_dialogue.emit()
		)
