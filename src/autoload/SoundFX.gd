extends AudioStreamPlayer

class_name SoundFX

func play_sound(key: String, db: float = 0, pitch: float = 1.0) -> void:
	volume_db = db
	pitch_scale = pitch
	stream = load('res://assets/sounds/' + key + '.wav')
	playing = true
