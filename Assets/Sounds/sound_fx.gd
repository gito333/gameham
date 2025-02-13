extends Node

var sounds = {
	"Click" : load("res://Assets/Sounds/Click.wav")
}

@onready var sound_players = get_children()

func play(sound_name):
	var sound_to_play = sounds[sound_name]
	for sound_player in sound_players:
		if !sound_player.playing:
			sound_player.stream = sound_to_play
			sound_player.play()
			return
