extends Area2D

class_name SwitchObject

export var state = false
var click_player: AudioStreamPlayer2D

func _ready() -> void:
	create_audio_node()
	
func create_audio_node() -> void:
	click_player = AudioStreamPlayer2D.new()
	add_child(click_player)
	click_player.stream = load('res://assets/sounds/click.wav')
	click_player.volume_db = -10
	
func set_state(new_state: bool) -> void: 
	play_sound_if_state_changed(new_state)
	state = new_state
	
func play_sound_if_state_changed(new_state: bool) -> void:
	if new_state != state:
		click_player.pitch_scale = 0.8 if new_state else 0.4
		click_player.playing = true
