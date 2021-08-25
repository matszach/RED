extends Control

class_name MainMenu

func _ready() -> void:
	disable_ContibuteButton_if_needed()

func disable_ContibuteButton_if_needed() -> void:
	if not 'stage' in StateHandlerInstance.state:
		$ButtonsVBox/ContinueButton.disabled = true

func _on_NewGameButton_pressed() -> void:
	get_tree().change_scene("res://src/levels/Level_01.tscn")
	
func _on_ContinueButton_pressed() -> void:
	var path: String = StateHandlerInstance.state.stage
	get_tree().change_scene(path)

func _on_ExitButton_pressed() -> void:
	get_tree().quit()

func _on_SoundButton_pressed() -> void:
	var master_id: int = AudioServer.get_bus_index("Master")
	var is_mute: bool = AudioServer.is_bus_mute(master_id)
	AudioServer.set_bus_mute(master_id, not is_mute)	
	$ButtonsVBox/SoundButton.text = 'Sound (%s)' % ('ON' if is_mute else 'OFF')
		
func _on_ControlsButton_pressed() -> void:
	get_tree().change_scene('res://src/screens/ControlsMenu.tscn')
