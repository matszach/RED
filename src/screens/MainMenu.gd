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

