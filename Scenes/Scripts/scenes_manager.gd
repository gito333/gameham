extends CanvasLayer

signal start_game
signal delete_level

@onready var title_screen: Control = $TitleScreen
@onready var pause_screen: Control = $PauseScreen
@onready var game_over_screen: Control = $GameOverScreen

var current_screen = null

func _ready():
	register_buttons()
	change_screen(title_screen)

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() > 0:
		for button in buttons:
			if button is ScreenButton:
				button.clicked.connect(_on_button_pressed)

func _on_button_pressed(button):
	SoundFx.play("Click")
	match button.name:
		"TitlePlay":
			change_screen(null)
			await(get_tree().create_timer(0.5).timeout)
			start_game.emit()
		"PauseClose":
			change_screen(null)
			await(get_tree().create_timer(0.75).timeout)
			get_tree().paused = false
		"GameOverRetry":
			change_screen(null)
			await(get_tree().create_timer(0.5).timeout)
			delete_level.emit()
			start_game.emit()
		"GameOverMainMenu":
			change_screen(title_screen)
			delete_level.emit()

func change_screen(new_screen):
	if current_screen != null:
		var disappear_tween = current_screen.disappear()
		await(disappear_tween.finished)
		current_screen.visible = false
	current_screen = new_screen
	if current_screen != null:
		var appear_tween = current_screen.create_tween()
		await(appear_tween.finished)
		get_tree().call_group("buttons", "set_disabled", false)

func game_over():
	# Incluir resultados del Run?
	change_screen(game_over_screen)

func pause_game():
	change_screen(pause_screen)
