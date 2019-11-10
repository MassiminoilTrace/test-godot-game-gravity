extends RigidBody

var gravita: Vector3 = Vector3(0,0,0)

func _ready():
	set_use_custom_integrator(true)


func _integrate_forces( body_state ):
    if is_using_custom_integrator():
        body_state.add_central_force(gravita)

func _on_gravita_cambiata(grav: Vector3):
	gravita = grav