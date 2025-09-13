extends Control

@export var deck_list_box : deck_list_ui

@export var all_units : card_grid
@export var all_actions : card_grid
@export var all_locations : card_grid
@export var all_resources : card_grid

var current_deck : deck_list = null

func open_for_deck(new_deck : deck_list):
	if new_deck == null:
		new_deck = deck_list.new()
	current_deck = new_deck
	deck_list_box.this_deck = current_deck
	deck_list_box.refresh_entries()

func _ready():
	populate_card_menu()

func on_card_clicked(card_data_ref):
	current_deck.add_card(card_data_ref)
	deck_list_box.refresh_entries()

func on_entered_card_clicked(card_data_ref):
	current_deck.remove_card(card_data_ref)
	deck_list_box.refresh_entries()
	
func populate_card_menu():
	var all_cards = ALL_CARDS.get_all_cards()
	for card_ in all_cards.values():
		match card_.get_type():
			CARD_GLOBALS.CARD_TYPE.RESOURCE:
				all_resources.add_card_entry(card_)
			CARD_GLOBALS.CARD_TYPE.UNIT:
				all_units.add_card_entry(card_)
			CARD_GLOBALS.CARD_TYPE.ACTION:
				all_actions.add_card_entry(card_)
			CARD_GLOBALS.CARD_TYPE.LOCATION:
				all_locations.add_card_entry(card_)
