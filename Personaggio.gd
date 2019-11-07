extends KinematicBody

const K: float = 100.0
var in_movimento_avanti: bool = false


func _process(delta):
	if in_movimento_avanti:
		self.move_and_slide(-K*delta*self.transform.basis.z.normalized())
	self.move_and_collide(Vector3(0,-9.8,0)*delta)

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		in_movimento_avanti=true
	elif event.is_action_released("ui_up"):
		in_movimento_avanti = false
	
	if event is InputEventMouseMotion and Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		self.rotate_object_local(Vector3(0,1,0), -0.005*event.relative.x)