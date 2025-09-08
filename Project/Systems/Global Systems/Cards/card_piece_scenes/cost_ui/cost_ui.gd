@tool
extends Control
class_name card_cost_ui

var icon_scene = preload("res://Project/Systems/Global Systems/Cards/card_piece_scenes/cost_ui/Cost Icon/cost_icon.tscn")

@onready var my_box = $VBoxContainer
var base_cost : card_cost

func build(new_cost : card_cost):
	base_cost = new_cost
	
	for child_ in my_box.get_children():
		child_.queue_free()
	
	for resource_cost in new_cost.cost:
		var next_icon = icon_scene.instantiate()
		my_box.add_child(next_icon)
		next_icon.my_icon = CARD_GLOBALS.RESOURCE_ICONS[resource_cost]

func reset_cost():
	build(base_cost)
