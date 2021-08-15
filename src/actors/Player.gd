extends Actor

class_name Player

func _handle_move() -> void:
	var up_down = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var left_right = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement = Vector2(left_right, up_down) * speed
	var diagonal_move = not up_down == 0 and not left_right == 0
	if diagonal_move:
		movement /= sqrt(2)
	move_and_slide(movement)
	
func _turn_to_mouse() -> void:
	var cursor_pos = get_local_mouse_position()
	rotation += cursor_pos.angle()
	
func _process(delta: float) -> void:
	if not health.alive():
		get_tree().reload_current_scene()
	
func _physics_process(delta: float) -> void:
	_handle_move()
	_turn_to_mouse()
