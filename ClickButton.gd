extends SwitchObjectButton

class_name ClickButton
	
func _update_state() -> void:
	if not state:
		state = bodies_over.size() > 0
		$button.frame = 3 if state else 2
