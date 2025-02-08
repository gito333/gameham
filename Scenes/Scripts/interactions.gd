extends Control

@onready var label: Label = $TextureRect/Label

func _ready() -> void:
	visible = false

func interact(interaction_text):
	visible = true
	label.text = interaction_text

func hide_interactor():
	visible = false
