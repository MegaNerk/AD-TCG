@tool
extends Control
class_name card_cost_ui

var icon_scene = preload("res://Project/Systems/Global Systems/Cards/card_piece_scenes/cost_ui/Cost Icon/cost_icon.tscn")

@onready var my_box = $VBoxContainer

func build(new_cost : card_cost):
	for resource_cost in new_cost.cost:
		var next_icon = icon_scene.instantiate()
		my_box.add_child(next_icon)
		next_icon.my_icon = CARD_GLOBALS.RESOURCE_ICONS[resource_cost]
