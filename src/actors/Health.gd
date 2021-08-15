extends Object

class_name Health

var _curr_hp: float = 0
var _max_hp: float = 100
var _regen_rate: float = 0.02

func get_hp() -> float:
	return  _curr_hp

func init(max_hp: float = 100, regen_rate: float = 0.02) -> Health:
	_curr_hp = max_hp
	_max_hp = max_hp
	_regen_rate = regen_rate
	return self
	
func damage(dmg_v: float) -> Health:
	_curr_hp = max(_curr_hp - dmg_v, 0)
	return self
	
func heal(heal_v: float) -> Health:
	_curr_hp = min(_curr_hp + heal_v, _max_hp)
	return self

func regen() -> Health:
	return heal(_regen_rate)
	
func alive() -> bool:
	return _curr_hp > 0

func fill() -> Health:
	_curr_hp = _max_hp
	return self
