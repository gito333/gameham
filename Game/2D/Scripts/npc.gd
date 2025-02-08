extends Node2D
class_name NPCBase

@export var speed: float = 50.0  # Velocidad normal del NPC
var original_speed: float  # Guardamos la velocidad inicial
var interacting: bool = false  # Para saber si estamos interactuando

func _ready():
	original_speed = speed  # Guardamos la velocidad inicial

func _process(delta):
	if interacting:
		return  # Si está interactuando, no se mueve
	position.x += speed * delta  # Movimiento manual

func interact():
	print("NPC: ¡Hola, jugador! Me quedo quieto.")
	interacting = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Si el jugador entra en el área
		print("NPC: Jugador detectado, reduciendo velocidad.")
		speed = original_speed * 0.2  # Reduce la velocidad al 20%

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":  # Si el jugador sale del área
		print("NPC: Jugador fuera, vuelvo a mi velocidad normal.")
		speed = original_speed  # Recupera la velocidad normal
