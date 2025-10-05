extends Node
class_name server_entry
signal server_clicked(self_ref : server_entry)

@onready var my_ad_button = $AD_Button

@export var lobby_name : String:
	set(value):
		lobby_name = value
		name_label.text = lobby_name

@export var gamemode : String:
	set(value):
		gamemode = value
		gamemode_label.text = gamemode

@export var players : String:
	set(value):
		players = value
		players_label.text = players

@export var host : String:
	set(value):
		host = value
		host_label.text = host

@export var has_password : bool:
	set(value):
		has_password = value
		if has_password:
			password_label.text = "Yes"
		else: password_label.text = "No"

@export var name_label : Label
@export var gamemode_label : Label
@export var players_label : Label
@export var host_label : Label
@export var password_label : Label

func _on_ad_button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				emit_signal("server_clicked", self)
