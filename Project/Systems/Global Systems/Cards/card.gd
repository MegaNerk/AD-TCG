extends Control

@onready var name_label = $MarginContainer/VBoxContainer/HBoxContainer/Name
@onready var image_slot = $MarginContainer/VBoxContainer/TextureRect

@export var card_data : card_content:
	set(value):
		card_data = value

var my_layout : card_layout

var my_combat_stats : combat_icons
var my_cost : card_cost_ui

func _init(new_data : card_content = card_data):
	card_data = new_data

func _ready():
	load_layout()

#Reads card resource meta data and creates visual card
func load_layout():
	for child_ in get_children():
		child_.queue_free()
	
	if card_data != null:
		my_layout = card_data.layout.instantiate()
		add_child(my_layout)
		my_layout.set_up_card_layout(card_data)
	
	my_combat_stats = my_layout.combat_slot
	my_cost = my_layout.cost_slot

#region Outside access
	#region Combat stats
#Returns this cards' atk value if it exists, otherwise returns 0
func get_atk() -> int:
	if my_combat_stats != null:
		return my_combat_stats.atk_value
	return 0

#Returns this cards' def value if it exists, otherwise returns 0
func get_def() -> int:
	if my_combat_stats != null:
		return my_combat_stats.def_value
	return 0

#Adjusts this cards atk by the given amount (Can be negative)
func adjust_atk(amt : int):
	if my_combat_stats != null:
		my_combat_stats.atk_value += amt

#Adjusts this cards def by the given amount (Can be negative)
func adjust_def(amt : int):
	if my_combat_stats != null:
		my_combat_stats.def_value += amt

#Resets this cards atk to it's default value
func reset_atk():
	if my_combat_stats != null:
		my_combat_stats.atk_value = my_combat_stats.BASE_ATK

#Resets this cards atk to it's default value
func reset_def():
	if my_combat_stats != null:
		my_combat_stats.def_value = my_combat_stats.BASE_DEF
	#endregion Combat stats

	#region Cost
#Returns a dictionary of resource types and their required amounts
func get_base_cost() -> Dictionary:
	var cost_component = card_data.get_cost()
	var output : Dictionary= {}
	if cost_component == null:
		return output
	for req_ in cost_component.cost:
		if req_ not in output.keys():
			output[req_] = 1
		else: output[req_] += 1
	#TODO: Connect to system to track cost-effects
	return output
	#endregion Cost

	#region Card text
#Returns this cards' effect text
func get_default_card_text() -> String:
	return card_data.get_effect_text()

func get_current_card_text() -> String:
	return my_layout.get_body_text()

func override_card_text(new_text : String):
	my_layout.change_body_text(new_text)

func reset_card_text():
	my_layout.change_body_text(card_data.get_effect_text())
	#endregion Card text
#endregion Outside access
