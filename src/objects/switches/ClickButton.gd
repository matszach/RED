extends SwitchObjectButton

class_name ClickButton
	
# set to on when a body over and stays on forever
func _update_state() -> void:
	if not state:
		set_state(bodies_over.size() > 0)
		$button.frame = 3
