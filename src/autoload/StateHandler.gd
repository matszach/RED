extends Node

class_name StateHandler

const path: String = 'user://save_data.json'

var state: Dictionary = {}

func _ready() -> void:
	load_state()

func set_item(key: String, value) -> StateHandler:
	state[key] = value
	return self
	
func reset() -> StateHandler:
	state = {}
	return self

func save_state() -> StateHandler:
	var file = File.new()
	file.open(path, File.WRITE)
	var line = to_json(state)
	file.store_line(line)
	file.close()
	return self

func load_state() -> void:
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var line: String = file.get_line()
		state = parse_json(line)
