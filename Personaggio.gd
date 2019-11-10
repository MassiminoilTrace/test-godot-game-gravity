extends KinematicBody

const K: float = 100.0
var in_movimento_avanti: bool = false

var gravita = Vector3(0,-9.8,0)

func _process(delta):
	if in_movimento_avanti:
		self.move_and_slide(-K*delta*self.transform.basis.z.normalized())
	self.move_and_collide(gravita*delta)

func _physics_process(delta):
	self.look_at(self.transform.origin-self.transform.basis.z.normalized(), -gravita.normalized())

func _input(event):
	if event.is_action_pressed("ui_up"):
		in_movimento_avanti=true
	elif event.is_action_released("ui_up"):
		in_movimento_avanti = false
	
	if event is InputEventMouseMotion and Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		self.rotate_object_local(Vector3(0,1,0), -0.005*event.relative.x)

func _on_gravita_cambiata(grav: Vector3):
	gravita = grav
