extends Area2D


@export var dialogue : Node


func _player_entered(body):
	if body.has_meta("player"):
		print("yep")
		dialogue.start_dialogue()
