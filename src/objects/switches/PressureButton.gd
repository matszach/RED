extends SwitchObjectButton

class_name PressureButton
	
# is on only when at least one body over
func _update_state() -> void:
	set_state(bodies_over.size() > 0)
	$button.frame = 1 if state else 0
