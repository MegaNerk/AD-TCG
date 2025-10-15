extends Control

@onready var main_menu = $CanvasLayer/MainMenu
@onready var deck_viewer = $CanvasLayer/DeckViewer
@onready var server_browser = $CanvasLayer/ServerBrowser
@onready var steam_lobby = $CanvasLayer/SteamLobby

func _ready():
	DisplayServer.window_set_min_size(Vector2i(1280,720))
	DisplayServer.window_set_size(Vector2i(1280,720))
	get_window().move_to_center()
	
	main_menu.decks_pressed.connect(_open_decks)
	main_menu.singleplayer_pressed.connect(_open_steam_lobby)
	main_menu.multiplayer_pressed.connect(_open_server_browser)
	deck_viewer.back_pressed.connect(_open_main_menu)
	server_browser.back_pressed.connect(_open_main_menu)
	server_browser.create_pressed.connect(_open_steam_lobby)
	steam_lobby.leave_pressed.connect(_open_server_browser)

func _open_decks():
	main_menu.visible = false
	deck_viewer.visible = true

func _open_main_menu():
	main_menu.visible = true
	deck_viewer.visible = false
	server_browser.visible = false
	steam_lobby.visible = false

func _open_server_browser():
	main_menu.visible = false
	steam_lobby.visible = false
	server_browser.visible = true

func _open_steam_lobby():
	main_menu.visible = false
	server_browser.visible = false
	steam_lobby.visible = true
