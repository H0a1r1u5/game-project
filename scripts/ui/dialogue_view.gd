class_name DialogueView
extends Control

@export var sentence:Array[String]
var cur_sentence_idx:int = -1

func _on_next_sentence():
	cur_sentence_idx += 1
	if cur_sentence_idx >= sentence.size():
		get_tree().change_scene_to_file("res://scenes/gaming.tscn")
	else:
		%DialogueLab.text = sentence[cur_sentence_idx]

func _ready() -> void:
	%DialogueBtn.pressed.connect(_on_next_sentence)
	_on_next_sentence()
	GameManager.change_game_state(GameEnum.GameState.Dialogue)
