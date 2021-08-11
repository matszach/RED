extends Area2D

class_name LevelExit

export var next_level: PackedScene

func _on_LevelExit_body_entered(body: Node) -> void:
	if next_level:
		get_tree().change_scene_to(next_level)
