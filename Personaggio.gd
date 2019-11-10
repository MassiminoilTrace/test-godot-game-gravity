extends KinematicBody

const K: float = 100.0
var in_movimento_avanti: bool = false

var gravita = Vector3(0,-9.8,0)

func _process(delta):
	if in_movimento_avanti:
		self.move_and_slide(-K*delta*self.transform.basis.z.normalized())
	self.move_and_collide(gravita*delta)

func _physics_process(delta):
	#self.look_at(self.transform.origin-self.transform.basis.z.normalized(), -gravita.normalized())
	pass

func _input(event):
	if event.is_action_pressed("ui_up"):
		in_movimento_avanti=true
	elif event.is_action_released("ui_up"):
		in_movimento_avanti = false
	
	if event is InputEventMouseMotion and Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		self.rotate_object_local(Vector3(0,1,0), -0.005*event.relative.x)

func _on_gravita_cambiata(grav: Vector3):
	gravita = grav
	var coeff_proiez_z = self.transform.basis.z.dot(Vector3(0,0,-1))
	if abs(coeff_proiez_z) < 0.05:#Se il coefficiente è troppo vicino a zero, la matrice di trasformazione diventa instabile
		coeff_proiez_z= -1
	self.look_at_from_position(self.transform.origin, self.transform.origin+coeff_proiez_z*Vector3(0,0,1), -gravita)
