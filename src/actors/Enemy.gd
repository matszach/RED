extends Actor

class_name Enemy

func _get_player() -> Node:
	var parent = get_parent()
	while not parent is BaseLevel:
		parent = parent.get_parent()
	var player = parent.get_node('Characters/Player')
	return player
