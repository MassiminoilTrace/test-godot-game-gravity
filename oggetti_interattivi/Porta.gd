extends Spatial

export var aperta = false

func _ready():
	pass

func aggiorna_animazione():
	self.visible = aperta

func commuta():
	aperta=not aperta
	aggiorna_animazione()

func _on_commuta(val: bool):
	aperta = val
	commuta()

func apri():
	aperta = true
	aggiorna_animazione()

func chiudi():
	aperta = false
	aggiorna_animazione()