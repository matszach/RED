extends AudioStreamPlayer

class_name MusicPlayer

onready var songs: RingArray = RingArray.new().init([
	'res://assets/music/01.wav',
	'res://assets/music/02.wav'	
])

func _ready() -> void:
	volume_db = -3
	start()

func start() -> void:
	play_next()
	connect('finished', self, 'play_next')

func play_next() -> void:
	var path: String = songs.next()
	stream = load(path)
	play()
