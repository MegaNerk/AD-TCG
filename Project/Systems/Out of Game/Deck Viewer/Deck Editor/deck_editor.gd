extends Control

@export var deck_list_box : deck_list_ui

@export var all_units : card_grid
@export var all_actions : card_grid
@export var all_locations : card_grid
@export var all_resources : card_grid

@export var test_card_set_units : Array[card_content]
@export var test_card_set_actions : Array[card_content]
@export var test_card_set_locations : Array[card_content]
@export var test_card_set_resources : Array[card_content]

var current_deck : deck_list = null

func open_for_deck(new_deck : deck_list):
	if new_deck == null:
		new_deck = deck_list.new()
	current_deck = new_deck
	deck_list_box.this_deck = current_deck
	deck_list_box.refresh_entries()

func _ready():
	for card_ in test_card_set_units:
		all_units.add_card_entry(card_)
	for card_ in test_card_set_actions:
		all_actions.add_card_entry(card_)
	for card_ in test_card_set_locations:
		all_locations.add_card_entry(card_)
	for card_ in test_card_set_resources:
		all_resources.add_card_entry(card_)

func on_card_clicked(card_data_ref):
	current_deck.add_card(card_data_ref)
	deck_list_box.refresh_entries()

func on_entered_card_clicked(card_data_ref):
	current_deck.remove_card(card_data_ref)
	deck_list_box.refresh_entries()
