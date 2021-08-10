extends KinematicBody2D

export var slide_by: Vector2 = Vector2(100, 0)
export var slide_speed_ratio: float = 5
export var switches: Array = []

var _switches: Array = []
var open_state: bool = false
onready var position_closed: Vector2 = position
onready var position_open: Vector2 = position + slide_by

func _ready() -> void:
	for path in switches:
		var node = get_node(path)
		_switches.append(node)
		
func _check_switch_condition() -> void:
	var new_open_state = true
	for switch in _switches:
		if not switch.state:
			new_open_state = false
			break
	open_state = new_open_state
	
func _move() -> void:
	var position_target = position_open if open_state else position_closed
	var movement = (position_target - position) * slide_speed_ratio
	move_and_slide(movement)

func _process(delta: float) -> void:
	_check_switch_condition()
	_move()
