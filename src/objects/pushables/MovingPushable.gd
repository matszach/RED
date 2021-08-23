extends Pushable

class_name MovingPushable

var flip: bool = false
var timer: Timer = Timer.new()

func _ready() -> void:
	add_child(timer) # if not a child then never processes
	timer.one_shot = true # if not true then would loop

func _process(delta: float) -> void:
	_slide()
	_bounce()

func _slide() -> void:
	var new_v = Vector2(1, 0) * on_push_velocity
	new_v = new_v.rotated(rotation)
	if flip:
		new_v = new_v * -1
	velocity += new_v

func _bounce() -> void:
	if is_on_wall() and timer.time_left <= 0:
		push_audio.playing = true
		flip = not flip
		timer.start(0.1)
