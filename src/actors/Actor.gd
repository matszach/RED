extends KinematicBody2D

class_name Actor

export var speed = 300

func _get_move_vector(direcrion: float) -> Vector2:
	return Vector2(speed, 0).rotated(direcrion)
