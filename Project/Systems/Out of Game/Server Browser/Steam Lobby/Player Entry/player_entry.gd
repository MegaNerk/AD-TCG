@tool
extends Node

@export var player_name : String = "Player Name":
	set(value):
		player_name = value
		player_name_label.text = player_name

@export var is_host : bool = false:
	set(value):
		is_host = value
		crown_sprite.visible = is_host

@export var actions_available : bool = true:
	set(value):
		actions_available = value
		actions.visible = actions_available

@export var promote_available : bool = true:
	set(value):
		promote_available = value
		promote_button.visible = promote_available

@export var kick_available : bool = true:
	set(value):
		kick_available = value
		kick_button.visible = kick_available

@export var player_name_label : Label
@export var promote_button : AD_Button
@export var kick_button : AD_Button
@export var actions : HBoxContainer
@export var crown_sprite : Sprite2D
