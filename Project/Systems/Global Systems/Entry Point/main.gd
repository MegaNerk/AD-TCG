extends Control

@onready var main_menu = $CanvasLayer/MainMenu
@onready var deck_viewer = $CanvasLayer/DeckViewer

func _ready():
	DisplayServer.window_set_min_size(Vector2i(1280,720))
	DisplayServer.window_set_size(Vector2i(1280,720))
	get_window().move_to_center()
	
	main_menu.decks_pressed.connect(_open_decks)
	deck_viewer.back_pressed.connect(_open_main_menu)

func _open_decks():
	main_menu.visible = false
	deck_viewer.visible = true

func _open_main_menu():
	main_menu.visible = true
	deck_viewer.visible = false
