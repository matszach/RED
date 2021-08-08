extends Node2D

class_name BaseLevel

func set_player_camera_limits() -> void:
	var player: Player = get_node('Player')
	var camera: Camera2D = player.get_node('Camera2D')
	var tilemap: TileMap = get_node('TileMap')
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	camera.limit_left = map_limits.position.x * map_cellsize.x
	camera.limit_right = map_limits.end.x * map_cellsize.x
	camera.limit_top = map_limits.position.y * map_cellsize.y
	camera.limit_bottom = map_limits.end.y * map_cellsize.y

func _ready() -> void:
	pass
	# set_player_camera_limits()
