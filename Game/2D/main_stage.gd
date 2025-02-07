extends Node2D

func _ready() -> void:
	var map = $Map
	#for object in map.get_children():
		#if object.has_signal("interact")

func _on_interact_object():
	print("Coll")
