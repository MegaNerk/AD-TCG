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
@export var close_lobby : AD_Button
@export var leave_lobby : AD_Button

#region External Signal Connections

#endregion

#region Internal Signal Connections
func on_password_toggled(new_state):
	password.visible = new_state

func on_join_player_pressed():
	pass

func on_join_spec_pressed():
	pass

func on_leave_lobby_pressed():
	emit_signal("leave_pressed")
#endregion Signal Connections
