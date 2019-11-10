extends Spatial


func _on_gravita_cambiata(grav: Vector3):
	for ogg in self.get_children():
		if ogg.has_method("_on_gravita_cambiata"):
			ogg._on_gravita_cambiata(grav)

