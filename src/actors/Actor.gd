extends KinematicBody2D

class_name Actor

export var speed = 300
export var max_hp = 100
export var regen_rate = 0.02
onready var health = Health.new().init(max_hp, regen_rate)

func _get_move_vector(direcrion: float) -> Vector2:
	return Vector2(speed, 0).rotated(direcrion)
