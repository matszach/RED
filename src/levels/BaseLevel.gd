extends Node2D

class_name BaseLevel

func set_player_camera_limits() -> void:
	var player: Player = $Characters/Player
	var camera: Camera2D = $Characters/Player/Camera2D
	var tilemap: TileMap = $TileMap
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	camera.limit_left = map_limits.position.x * map_cellsize.x + 20
	camera.limit_right = map_limits.end.x * map_cellsize.x - 20
	camera.limit_top = map_limits.position.y * map_cellsize.y + 20
	camera.limit_bottom = map_limits.end.y * map_cellsize.y +- 20

func _ready() -> void:
	set_player_camera_limits()
