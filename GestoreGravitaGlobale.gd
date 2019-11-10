extends Spatial

var gravita: Vector3 = Vector3(0,-9.8,0)


signal gravita_cambiata


func _ready():
	emit_signal("gravita_cambiata", gravita)


func gira_gravita():
	gravita = gravita.cross(Vector3(0,0,-1)).normalized()*9.8
	emit_signal("gravita_cambiata", gravita)