extends SwitchObject

class_name PressureButton

var bodies_over: Array = []

func _on_PressureButton_body_entered(body: Node) -> void:
	bodies_over.append(body)
	_update_state()

func _on_PressureButton_body_exited(body: Node) -> void:
	bodies_over.erase(body)
	_update_state()	
	
func _update_state() -> void:
	state = bodies_over.size() > 0
	$button.frame = 1 if state else 0
