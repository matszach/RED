extends Button

class_name PButton

func _on_Button_button_down() -> void:
	SoundFXInstance.play_sound('button', -2, 0.4)

