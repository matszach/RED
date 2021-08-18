extends Control

class_name MainMenu

func _on_NewGameButton_pressed() -> void:
	get_tree().change_scene("res://src/levels/Level_01.tscn")

func _on_ExitButton_pressed() -> void:
	get_tree().quit()
