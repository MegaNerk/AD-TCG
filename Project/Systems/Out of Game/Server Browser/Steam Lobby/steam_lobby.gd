extends Node
signal leave_pressed

@export var player_entry_scene : PackedScene

@export var lobby_name : LineEdit
@export var mode : OptionButton
@export var player_max : OptionButton
@export var spec_max : OptionButton
@export var pass_check : CheckBox
@export var password : LineEdit

@export var join_players : AD_Button
@export var join_spec : AD_Button
@export var close_lobby_button : AD_Button
@export var leave_lobby_button : AD_Button

@export var player_container : GridContainer
@export var spec_container : GridContainer

var player_list : Array = []

#region Lobby Management
func create_lobby():
	NETWORK.create_lobby()

func close_lobby():
	pass
#endregion Lobby Management

#region Internal Signal Connections
func on_password_toggled(new_state):
	password.visible = new_state

func on_join_player_pressed():
	pass

func on_join_spec_pressed():
	pass

func on_leave_lobby_pressed():
	emit_signal("leave_pressed")
	NETWORK.leave_lobby()
#endregion Signal Connections

#region Player Management
func move_to_players(player_ref):
	pass

func move_to_spec(player_ref):
	pass

func kick_player(player_ref):
	pass

func promote_player(player_ref):
	pass
#endregion Player Management
