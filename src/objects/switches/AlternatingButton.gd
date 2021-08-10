extends SwitchObjectButton

class_name AlternatingButtond

var _block_state = false
	
# can be clicked and unclicked
func _update_state() -> void:
	if bodies_over.size() == 0:
		_block_state = false
	elif not _block_state:
		_block_state = true
		state = not state
		$button.frame = 5 if state else 4
