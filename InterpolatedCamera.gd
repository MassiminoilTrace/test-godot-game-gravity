extends InterpolatedCamera

func _ready():
	pass

"""
Dovrebbe salvare dove si trova il nodo personaggio con export
Poi, calcola il vettore obiettivocamera-personaggio

In seguito, faccio un Raycast dal personaggio, inserendo come eccezioni
il personaggio stesso e la camera.

In questo modo, posso calcolare la distanza rispetto al primo oggetto che trovo con cui collido.
Dispongo la camera a una distanza minore rispetto a quella di collisione,
così non clippa
"""