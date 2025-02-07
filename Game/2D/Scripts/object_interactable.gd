extends Area2D
class_name InteractObject

@onready var collision: CollisionShape2D = $CollisionShape2D

signal interact

func _on_body_entered(body: Node) -> void:
	interact.emit()
	print(body.name + " collided")
