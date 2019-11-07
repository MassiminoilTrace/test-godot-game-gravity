extends Spatial

var mouse_catturato: bool = false

var grav_attuale: Vector3 = Vector3(0,0,0)

func _ready():
	pass


func _input(event):
	if event.is_action_pressed("cattura_mouse"):
		mouse_catturato = not mouse_catturato
		if mouse_catturato:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)