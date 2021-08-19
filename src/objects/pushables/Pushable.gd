extends KinematicBody2D

class_name Pushable

var is_pushable: bool = true
var velocity: Vector2 = Vector2.ZERO
var pushing_bodies: Array = []

export var dampen_ratio: float = 0.9
export var on_push_velocity: float = 100
export var bounceback_ratio: float = 0.1

func _ready() -> void:
	var push_detector: Area2D = $PushDetector
	push_detector.connect('body_entered', self, '_on_PushDetector_body_entered')
	push_detector.connect('body_exited', self, '_on_PushDetector_body_exited')
		
func _on_PushDetector_body_entered(body: KinematicBody2D) -> void:
	if not body:
		return
	if body is Player or 'is_pushable' in body:
		pushing_bodies.append(body)

func _on_PushDetector_body_exited(body: KinematicBody2D) -> void:
	pushing_bodies.erase(body)
	
func _get_pushed() -> void:
	for body in pushing_bodies:
		var direction = position - body.position
		direction = direction.normalized()
		if abs(direction.x) > abs(direction.y):
			direction.y = 0
		else:
			direction.x = 0
		var force = direction * on_push_velocity
		if 'is_pushable' in body:
			force *= bounceback_ratio
		velocity += force
		
func _apply_traction() -> void:
	velocity *= dampen_ratio
	
func _clamp_velocity() -> void:
	velocity = velocity.clamped(on_push_velocity)
	
func _physics_process(delta: float) -> void:
	_get_pushed()
	_clamp_velocity()
	velocity = move_and_slide(velocity)
	_apply_traction()
	
