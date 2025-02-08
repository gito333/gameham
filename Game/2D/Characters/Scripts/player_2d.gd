extends CharacterBody2D
class_name Player

@export var speed: float = 300.0
@export var jump_force: float = -400.0
@export var smoothing : int = 50

var jump_direction: float = 0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	# Horizontal movement
	var direction : float = Input.get_axis("move_left", "move_right")
	if direction:
		if is_on_floor():
			velocity.x = direction * speed
			jump_direction = 0
		else:
			# Not to turn direction in air
			if jump_direction != -direction:
				velocity.x = direction * speed
				jump_direction = direction
	# Slow down to ZERO
	else:
		velocity.x = move_toward(velocity.x, 0, speed / smoothing)

	move_and_slide()

func _process(_delta: float) -> void:
	check_interacts()

func check_interacts():
	pass
