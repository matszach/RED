extends SwitchObject

class_name SwitchObjectButton

var bodies_over: Array = []

func _ready() -> void:
	connect('body_entered', self, '_on_CollisionShape2D_body_entered')
	connect('body_exited', self, '_on_CollisionShape2D_body_exited')

func _on_CollisionShape2D_body_entered(body: Node) -> void:
	bodies_over.append(body)
	_update_state()

func _on_CollisionShape2D_body_exited(body: Node) -> void:
	bodies_over.erase(body)
	_update_state()

func _update_state() -> void:
	pass
