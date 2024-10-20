class_name MainMenuView
extends Control

func _ready() -> void:
	%StartBtn.pressed.connect(GameManager.start_game)
	%QuitBtn.pressed.connect(GameManager.quit_game)
	GameManager.change_game_state(GameEnum.GameState.MainMenu)
