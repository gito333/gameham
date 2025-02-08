extends Node2D
class_name NPCBase

@export var speed: float = 50.0
@export var slow_mod: float = 0.2
var original_speed: float
var interacting: bool = false
var has_interacted: bool = false

func _ready():
	original_speed = speed

func _process(delta):
	if interacting:
		return
	position.x += speed * delta
	if not has_interacted:
		debug_interaction()

func interact():
	if not has_interacted:
		print("NPC: ¡Hola, jugador! Me quedo quieto.")
		interacting = true
		has_interacted = true
	else:
		print("Ya hemos interactuado... ¬¬")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not has_interacted:
		print("NPC: Jugador detectado, reduciendo velocidad.")
		speed = original_speed * slow_mod

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player" and interacting:
		print("NPC: Jugador fuera, vuelvo a mi velocidad normal.")
		speed = original_speed
		interacting = false

func debug_interaction() -> void:
	print("Ya hemos interactuado!")
