extends Area2D
class_name InteractableObject

var has_interacted: bool = false
var interaction_phrase: String = "¡Has interactuado con este objeto!"
var phrase: String = interaction_phrase

func interact():
	if not has_interacted:
		has_interacted = true
	else:
		phrase = ""
