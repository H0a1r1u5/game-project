extends CanvasLayer

const AVATER_MAP = {
	"main": preload("res://scenes/mainaveter.png"),
	"ghost": preload("res://scenes/ghostavater.png")
}

var dialogues = []
var current = 0

@onready var constant = $content
@onready var avater = $Avater

func _ready():
	hide_dialogue_box()
	show_dialogue_box([
		{avatar="ghost", text="So, you've made it. Impressive... but pointless. You think you’ll find answers here?That you’ll recover what was lost? You’re only running from the truth."},
		{avatar="main", text= "Who are you? What do you want from me?"},
		{avatar="ghost", text= "I am you.
(a mocking smile forms as it circles her slowly, its voice growing darker)
 I am the part of you that you refuse to see—the doubt, the guilt, the fear you try so hard to bury. Do you really think piecing together these silly fragments will fix everything?
		"},
		{avatar="main", text="I’m not afraid of the truth! I need to remember! My family is important to me!"}
		])


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		if current + 1 < dialogue.size():
			_show_dialogue(current + 1)
		else:
			hide_dialogue_box()
		get_tree().set_input_as_handled()

func show_dialogue_box(_dialogue):
	dialogues = _dialogues
	content.show()
	_show_dialogue(0)
	
	
func _show_dialogue(index):
	current = index 
	var dialogue = dialogues[current]
	content.text = dialogue.text
	avater.texture = AVATER_MAP[dialogue.avatar]
