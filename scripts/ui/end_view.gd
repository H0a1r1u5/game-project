class_name EndView
extends Control

func _ready() -> void:
	GameManager.change_game_state(GameEnum.GameState.End)
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/ui/main_menu_view.tscn")
