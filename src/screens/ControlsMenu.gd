extends Control

class_name ControlsMenu

func _on_ReturnButton_pressed() -> void:
	get_tree().change_scene('res://src/screens/MainMenu.tscn')
