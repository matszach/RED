extends Enemy

class_name Turret

onready var player_ref: Player
onready var gun: Node = $Gun
onready var shoot_timer: Timer = $Gun/Timer
export var rotation_rate: float = 0.03
export var fire_rate: float = 0.25
export var clockwise: bool = true

func rotate_towards_player() -> bool:
	var dir = position.direction_to(player_ref.position)
	var angle = dir.angle() - gun.rotation
	gun.rotation = fmod(gun.rotation, TAU)
	if angle > PI:
		angle -= TAU
	elif angle < -PI:
		angle += TAU
	gun.rotation += clamp(angle, -rotation_rate, rotation_rate)
	return abs(angle) < rotation_rate
	
func sees_player() -> bool:
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, player_ref.position, [self], collision_mask)
	if result and result.collider == player_ref:
		return true
	return false
	
func shoot() -> void:
	if shoot_timer.time_left <= 0:
		fire_bullet()
		shoot_timer.start(fire_rate)
		
func fire_bullet() -> void:
	print('fireing now')
	
func idle_rotate() -> void:
	gun.rotation += rotation_rate/3

func _process(delta: float) -> void:
	if player_ref and sees_player() and rotate_towards_player():
		shoot()
	else:
		idle_rotate()

func _on_SightRange_body_entered(body: Node) -> void:
	player_ref = body
	
func _on_SightRange_body_exited(body: Node) -> void:
	player_ref = null
