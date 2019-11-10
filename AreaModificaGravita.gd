extends Area

func _ready():
	pass

func _cambia_grav(grav:Vector3):
	self.gravity_vec = grav
	print(self.gravity_vec)