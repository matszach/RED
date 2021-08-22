extends Object

class_name RingArray

var _data: Array = []
var _index: int = 0

func init(data: Array) -> RingArray:
	_data = data
	return self
	
func next():
	var value = _data[_index]
	_index += 1
	if _index > _data.size() - 1:
		_index = 0
	return value
