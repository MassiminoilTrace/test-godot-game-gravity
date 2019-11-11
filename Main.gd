extends Spatial

var mouse_catturato: bool = false




func _ready():
	pass

func _input(event):
	if event.is_action_pressed("cattura_mouse"):
		mouse_catturato = not mouse_catturato
		if mouse_catturato:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event.is_action_pressed("ui_accept"):
		$"Gestore gravita globale".gira_gravita()

func _on_Interruttore_pulsante_attivato(val):
	var r = preload("res://2d ui/avviso_riavvia.tscn")
	self.call_deferred("add_child", r.instance())