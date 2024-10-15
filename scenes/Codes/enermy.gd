extends RigidBody2D
@onready var game_manager = %GameManager
 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (body.name  == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 200):
			print("Destroy enermy")
			queue_free()
			body.jump() 
		else:
			print("Decrease player health")
			game_manager.decrease_health()
			if (x_delta > 0):
				body.jump_slide(500)
			else:
				body.jump_slide(-500)
				
