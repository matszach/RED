extends Node

class_name DialogReader

var _loaded: Dictionary

func _ready() -> void:
	var file: File = File.new()
	file.open('res://assets/dialog.json', file.READ)
	var content = file.get_as_text()
	_loaded = parse_json(content)
	file.close()
	
func get(key: String) -> String:
	return _loaded[key]
