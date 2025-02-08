extends Area2D

var interactable_object = null
@onready var interactions: Control = $Interactions

func _ready() -> void:
	interactions.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and interactable_object:
		if not interactable_object.has_interacted:
			interactions.interact(interactable_object.phrase)
			print("E with: ", interactable_object.name)
			interactable_object.interact()
		else:
			return

func _on_area_entered(area: Area2D) -> void:
	print("Entró en el área:", area.name)
	if area.has_method("interact"):
		print("✅ Este objeto tiene el método interact()")
		interactable_object = area
	else:
		print("❌ Este objeto NO tiene interact()")

func _on_area_exited(_area: Area2D) -> void:
		interactable_object = null
		interactions.hide_interactor()
