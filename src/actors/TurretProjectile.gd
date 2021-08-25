extends Area2D

class_name TurretProjectile

onready var timer: Timer = $Timer
export var speed: float = 900
export var duration: float = 0.05
var velocity: Vector2 = Vector2(0, 0)

func fire(angle: float) -> void:
	rotation = angle
	velocity = Vector2.ONE.rotated(angle) * speed
	timer.start(duration)
	
func end() -> void:
	queue_free()

func _process(delta: float) -> void:
	position += velocity * delta
	if timer.time_left <= 0:
		end()

func _on_TurretProjectile_body_entered(body: Node) -> void:
	end()
	if body is Player:
		body.health.damage(15)
