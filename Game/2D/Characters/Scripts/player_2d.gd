extends CharacterBody2D
class_name Player

@export var walk_speed: float = 30.0
@export var run_speed: float = 60.0
@export var jump_force: float = -400.0
@export var smoothing: int = 50
var direction: float = 0
var speed: float
var running: bool = false

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var jump_direction: float = 0

func _ready() -> void:
	anim_sprite.play("idle")

func _physics_process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		anim_sprite.play("jump")
		velocity += get_gravity() * delta
	# Saltar
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	# Toggle Sprint
	if Input.is_action_just_pressed("sprint") and is_on_floor():
		running = not running
	# Detectar dirección de entrada
	var input_direction = Input.get_axis("move_left", "move_right")
	if running:
		if velocity.x == 0:
			direction = input_direction
		elif input_direction == 0:
			direction = input_direction
	else:
		direction = input_direction
	# Definir velocidad según si está corriendo o caminando
	speed = run_speed if running else walk_speed
	# Movimiento horizontal
	if direction != 0:
		# Animaciones de movimiento
		if not is_on_floor():
			anim_sprite.play("jump")
		else:
			anim_sprite.play("run" if running else "walk")
		# Girar sprite
		anim_sprite.flip_h = direction < 0
		# Movimiento en el suelo
		if is_on_floor():
			velocity.x = direction * speed
			jump_direction = 0
		else:
			if jump_direction != -direction:
				velocity.x = direction * speed
				jump_direction = direction
	else:
		# Si NO hay dirección de entrada, desaceleramos con move_toward
		velocity.x = move_toward(velocity.x, 0, speed / smoothing)
		if is_on_floor():
			anim_sprite.play("idle")

	move_and_slide()

func _process(_delta: float) -> void:
	check_interacts()

func check_interacts():
	pass
