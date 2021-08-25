extends Enemy

class_name Turret

onready var player_ref: Player
onready var gun: Node = $Gun
onready var shoot_timer: Timer = $Gun/Timer
onready var shoot_audio: AudioStreamPlayer2D = $ShootAudioPlayer
onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()
onready var angle_offset: float = transform.get_rotation()
export var rotation_rate: float = 0.03
export var fire_rate: float = 0.10
export var clockwise: bool = true
export var bullet_spread: float = PI/30
export var disable_rotate: bool = false

func rotate_towards_player() -> bool:
	var dir = position.direction_to(player_ref.position)
	var angle = dir.angle() - gun.rotation - angle_offset
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
		play_sound()
		shoot_timer.start(fire_rate)
		
func fire_bullet() -> void:
	var projectile = preload("res://src/actors/TurretProjectile.tscn").instance()
	projectile.position = gun.get_node("BulletSpawnPosition").global_position
	get_tree().get_root().add_child(projectile)
	var shoot_direction = gun.rotation - PI/4 + rng.randf_range(-bullet_spread, bullet_spread) + angle_offset
	projectile.fire(shoot_direction)
	
func play_sound() -> void: 
	shoot_audio.pitch_scale = rng.randf_range(0.8, 1.2)
	shoot_audio.playing = true
	
func idle_rotate() -> void:
	if not disable_rotate:
		gun.rotation += rotation_rate/3 * (1 if clockwise else -1)

func _process(delta: float) -> void:
	if player_ref and sees_player() and rotate_towards_player():
		shoot()
	else:
		idle_rotate()

func _on_SightRange_body_entered(body: Node) -> void:
	player_ref = body
	
func _on_SightRange_body_exited(body: Node) -> void:
	player_ref = null
