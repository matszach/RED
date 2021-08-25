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
	
func store_game_state() -> void:
	var last_level_path = get_tree().current_scene.filename
	StateHandlerInstance.set_item('stage', last_level_path).save_state()

func _process(delta: float) -> void:
	if Input.is_action_just_released("restart_level"):
		_restart()
	if Input.is_action_just_pressed("to_menu"):
		get_tree().change_scene('res://src/screens/MainMenu.tscn')
	
func _restart() -> void:
	get_tree().reload_current_scene()

func _ready() -> void:
	set_player_camera_limits()
	store_game_state()
