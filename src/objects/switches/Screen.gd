extends StaticBody2D

class_name Screen

export var value_key: String = 'key'
export var relative_placement: Vector2 = Vector2(0, 0)
onready var label_holder: Node2D = $LabelHolder
onready var label: RichTextLabel = $LabelHolder/RichTextLabel
onready var animation_player: AnimationPlayer = $AnimationPlayerText
onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	var value = DialogReaderInstance.get(value_key);
	label.text = value
	label.margin_left = relative_placement.x
	label.margin_top = relative_placement.y
	label_holder.rotation = -rotation

func _on_PlayerNearbyDetector_body_entered(body: Node) -> void:
	animation_player.playback_speed = 1	
	audio.playing = true
	animation_player.play("show_text")

func _on_PlayerNearbyDetector_body_exited(body: Node) -> void:
	animation_player.playback_speed = 3
	animation_player.play_backwards("show_text")
