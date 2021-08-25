extends Control

class_name YouWinMenu

func _on_ToMainMenuButton_pressed() -> void:
	get_tree().change_scene('res://src/screens/MainMenu.tscn')
