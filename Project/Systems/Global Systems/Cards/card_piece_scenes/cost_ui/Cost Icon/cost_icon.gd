@tool
extends Node

@export var my_icon : Texture:
	set(value):
		my_icon = value
		call_deferred("change_icon", my_icon)

@onready var my_tex_rect = $MarginContainer/TextureRect

func _ready():
	change_icon(my_icon)

func change_icon(new_icon : Texture):
	if new_icon != null:
		my_tex_rect.texture = new_icon
