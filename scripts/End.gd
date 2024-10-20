class_name End
extends Area2D

var enable = true
func end_game():
	get_tree().change_scene_to_file("res://scenes/ui/end_view.tscn")

func _ready() -> void:
	body_entered.connect(func(body:Node2D):
		if not visible or not enable:
			return
		end_game.call_deferred()
		enable = false
		)
