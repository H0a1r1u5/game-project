extends Node
@onready var pause_panel = %PausePanel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var esc_pressed = Input.is_action_just_pressed("pause")
	if(esc_pressed == true): 
		get_tree().paused = true
		pause_panel.show()
		

func _on_button_pressed():
	pause_panel.hide()
	get_tree().pause = false# Replace with function body.
