extends Area2D
class_name InteractableObject

var has_interacted: bool = false

func interact():
	if has_interacted == false:
		print("¡Has interactuado con este objeto!")
		has_interacted = true
	else:
		print("Ya interactuaste con este objeto...  ¬¬")
