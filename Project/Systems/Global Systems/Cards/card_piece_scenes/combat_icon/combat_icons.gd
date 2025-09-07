@tool
extends Control
class_name combat_icons

enum ICON_TYPE {CHAOS, ORDER, ATK, HP}

@export var atk_texture : Texture:
	set(value):
		atk_texture = value
		update_atk_icon(atk_texture)

@export var def_texture : Texture:
	set(value):
		def_texture = value
		update_def_icon(def_texture)

@export var atk_value : int:
	set(value):
		atk_value = value
		update_atk(atk_value)

@export var def_value : int:
	set(value):
		def_value = value
		update_def(def_value)

@export var atk_icon : TextureRect
@export var def_icon : TextureRect
@export var atk_label : Label
@export var def_label : Label

var BASE_ATK : int
var BASE_DEF : int

func update_atk(new_int):
	atk_label.text = str(new_int)
	if new_int > BASE_ATK:
		atk_label.add_theme_color_override("font_color", Color.GREEN)
	elif new_int < BASE_ATK:
		atk_label.add_theme_color_override("font_color", Color.RED)
	else:
		atk_label.remove_theme_color_override("font_color")

func update_def(new_int):
	def_label.text = str(new_int)
	if new_int > BASE_DEF:
		def_label.add_theme_color_override("font_color", Color.GREEN)
	elif new_int < BASE_DEF:
		def_label.add_theme_color_override("font_color", Color.RED)
	else:
		def_label.remove_theme_color_override("font_color")

func update_atk_icon(new_tex):
	atk_icon.texture = new_tex

func update_def_icon(new_tex):
	def_icon.texture = new_tex

func build(new_stats : card_combat):
	BASE_ATK = new_stats.atk
	atk_value = new_stats.atk
	BASE_DEF = new_stats.hp
	def_value = new_stats.hp
