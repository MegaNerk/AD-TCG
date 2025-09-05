extends Resource
class_name card_content

signal content_changed

@export var image : Texture
@export var name : String
@export var faction : CARD_GLOBALS.FACTION
@export var type : CARD_GLOBALS.CARD_TYPE:
	set(value):
		type = value
		layout = CARD_GLOBALS.LAYOUTS_DICT[type]

@export var my_cost : card_cost
@export var my_effect : card_effect
@export var my_stats : card_combat

var layout : PackedScene:
	set(value):
		layout = value
		emit_signal("content_changed")

func get_image() -> Texture:
	return image

func get_card_name() -> String:
	return name

func get_faction() -> CARD_GLOBALS.FACTION:
	return faction

func get_type() -> CARD_GLOBALS.CARD_TYPE:
	return type

func get_cost() -> card_cost:
	return my_cost

func get_effect() -> card_effect:
	return my_effect

func get_effect_text() -> String:
	var output = ""
	if my_effect != null:
		output = my_effect.body_text
	return output

func get_combat_stats() -> card_combat:
	return my_stats
