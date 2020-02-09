extends Node

func _ready():
	pass



func _on_Area_body_entered(body):
	get_tree().reload_current_scene()
