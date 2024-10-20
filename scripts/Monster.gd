class_name Monster
extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var direction = 1


func _physics_process(delta: float) -> void:
	if GameManager.game_state != GameEnum.GameState.Gaming:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if $Sprite2D/RayCast2D.is_colliding():
		direction = -direction
		$Sprite2D.scale.x = direction

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func _ready() -> void:
	%Area2D.body_entered.connect(func(body:Node2D):
		GameEventBus.change_hp.emit()
		)
