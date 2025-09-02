extends Control

func _ready():
	DisplayServer.window_set_min_size(Vector2i(1280,720))
	DisplayServer.window_set_size(Vector2i(1280,720))
	get_window().move_to_center()
