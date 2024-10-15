extends Node

@onready var points_label = %PointsLabel
@export var hearts :Array[Node]

var points = 0
var lives = 5 

func decrease_health():
	lives -=1
	print(lives)
	for h in 5:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (lives == 0):
		get_tree().reload_current_scene()
 
	
	
func add_point():
	points += 1
	print(points)
	points_label.text = "points: " + str(points)
# Called when the node enters the scene tree for the first time.
