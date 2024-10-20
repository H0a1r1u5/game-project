class_name Manager
extends Node

@export var game_state:GameEnum.GameState

func start_game():
	get_tree().change_scene_to_file("res://scenes/gaming.tscn")
func quit_game():
	get_tree().quit()

func change_game_state(state:GameEnum.GameState):
	game_state = state
	# TODO 对应的切换
