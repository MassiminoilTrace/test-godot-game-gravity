extends KinematicBody

const K: float = 300.0
var in_movimento_avanti: bool = false
var t_rovescia_salto: int = 0

var gravita = Vector3(0,-9.8,0)

func _process(delta):
	if in_movimento_avanti:
		self.move_and_slide(-K*delta*self.transform.basis.z.normalized(), -gravita, false, 4, 0.785398, false)
	
	if t_rovescia_salto>0:
		t_rovescia_salto-=delta
		self.move_and_collide(-gravita*delta*0.6)
	else:
		self.move_and_collide(gravita*delta*0.6, false)
		

func _input(event):
	if event.is_action_pressed("ui_up"):
		in_movimento_avanti=true
	elif event.is_action_released("ui_up"):
		in_movimento_avanti = false
	
	if event is InputEventMouseMotion and Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		self.rotate_object_local(Vector3(0,1,0), -0.005*event.relative.x)
	
	salto(event)

func salto(event):
	if event.is_action_pressed("ui_salta"):
		t_rovescia_salto = 25

func _on_gravita_cambiata(grav: Vector3):
	gravita = grav
	var coeff_proiez_z = self.transform.basis.z.dot(Vector3(0,0,-1))
	if abs(coeff_proiez_z) < 0.05:#Se il coefficiente è troppo vicino a zero, la matrice di trasformazione diventa instabile
		coeff_proiez_z= -1
	
	var nuova_trasformazione = self.transform.looking_at(self.transform.origin+coeff_proiez_z*Vector3(0,0,1), -gravita)
	
	$Tween.interpolate_property(self, "transform", self.transform, nuova_trasformazione, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT,0)
	$Tween.start()
	#self.transform = self.transform.interpolate_with(self.transform,
	#self.look_at_from_position(self.transform.origin, self.transform.origin+coeff_proiez_z*Vector3(0,0,1), -gravita)
