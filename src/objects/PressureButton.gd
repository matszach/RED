extends SwitchObjectButton

class_name PressureButton
	
func _update_state() -> void:
	state = bodies_over.size() > 0
	$button.frame = 1 if state else 0
