extends Control

@export var deck_list_box : VBoxContainer
@export var unit_list_box : VBoxContainer
@export var action_list_box : VBoxContainer
@export var location_list_box : VBoxContainer
@export var resource_list_box : VBoxContainer

@export var all_units : card_grid
@export var all_actions : card_grid
@export var all_locations : card_grid
@export var all_resources : card_grid

@export var test_card_set_units : Array[card_content]
@export var test_card_set_locations : Array[card_content]

func open_for_deck(new_deck : deck_list):
	if new_deck == null:
		new_deck = deck_list.new()

func _ready():
	for card_ in test_card_set_units:
		all_units.add_card_entry(card_)
	for card_ in test_card_set_locations:
		all_locations.add_card_entry(card_)
