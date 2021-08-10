extends StaticBody2D

class_name plant

# choose one from 4 sprites
func _ready() -> void:
	var frame = randi() % 4
	$plant.frame = frame
