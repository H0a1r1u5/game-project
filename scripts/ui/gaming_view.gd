class_name GamingView
extends Control

@export var end:Area2D
@export var sentence:Array[String]
var cur_sentence_idx:int = -1
var dead:bool =false
var hp:int = 1:
	set(value):
		hp = value
		%HPLab.text = str(hp)
var star:int = 0:
	set(value):
		star = value
		%StarLab.text = str(star)
var tween_dialogue:Tween

func change_hp(val:int = 1):
	hp -= min(val,hp)
	if hp == 0 and not dead:
		# TODO 死亡
		dead = true
		get_tree().change_scene_to_file.call_deferred("res://scenes/ui/end_view.tscn")
		pass
func change_star(val:int = 1):
	star += val
	if star == 12:
		# TODO 开门
		end.visible = true
		pass
func start_dialogue():
	%DialogueLab.visible = true
	GameManager.change_game_state(GameEnum.GameState.Dialogue)
	tween_dialogue = create_tween()
	for i in range(sentence.size()):
		tween_dialogue.tween_callback(func():change_dialogue(i))
		tween_dialogue.tween_interval(1)
	tween_dialogue.tween_callback(func():
		%DialogueLab.visible = false
		GameManager.change_game_state(GameEnum.GameState.Gaming)
		)
	
func change_dialogue(idx:int):
	%DialogueLab.text = sentence[idx]

func _ready() -> void:
	hp = 5
	star = 0
	end.visible = false
	%DialogueLab.visible = false
	GameEventBus.change_hp.connect(change_hp)
	GameEventBus.get_star.connect(change_star)
	GameEventBus.start_dialogue.connect(start_dialogue)
	GameManager.change_game_state(GameEnum.GameState.Gaming)
