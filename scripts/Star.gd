class_name Star
extends Area2D

func _ready() -> void:
	body_entered.connect(func(body:Node2D):
		GameEventBus.get_star.emit()
		queue_free()
		)
