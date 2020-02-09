extends Spatial


signal pulsante_attivato

var conteggio_precedente: int = 0
var conteggio:int = 0

func _ready():
	$AnimationPlayer.play("non schiacciato")
	emit_signal("pulsante_attivato", false)

func anima():
	if conteggio > 0 and conteggio_precedente <=0:
		#se l'ho acceso
		$AnimationPlayer.play("schiacciato")
		print("attivato")
		emit_signal("pulsante_attivato", true)
	elif conteggio <= 0 and conteggio_precedente > 0:
		print("disattivato")
		$AnimationPlayer.play("non schiacciato")
		emit_signal("pulsante_attivato", false)
	
	conteggio_precedente = conteggio

func _on_Area_body_entered(body):
	conteggio+=1
	anima()


func _on_Area_body_exited(body):
	conteggio-=1
	anima()
