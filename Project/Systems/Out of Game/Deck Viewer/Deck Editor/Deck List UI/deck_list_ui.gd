extends Control
class_name deck_list_ui

signal card_clicked(card_ref : card_content)

@export var card_entry_scene : PackedScene

@export var name_plate : Label

@export var unit_list_box : VBoxContainer
@export var action_list_box : VBoxContainer
@export var location_list_box : VBoxContainer
@export var resource_list_box : VBoxContainer

var all_entries : Array = []
var this_deck : deck_list

func refresh_entries():
	for entry_ in all_entries:
		entry_.queue_free()
	all_entries = []
	
	name_plate.text = this_deck.get_deck_name()
	
	for card_ in this_deck.get_cards().keys():
		var new_entry = card_entry_scene.instantiate()
		
		new_entry.populate(card_)
		new_entry.set_count(this_deck.get_cards()[card_])
		
		match card_.get_type():
			CARD_GLOBALS.CARD_TYPE.UNIT:
				unit_list_box.add_child(new_entry)
			CARD_GLOBALS.CARD_TYPE.ACTION:
				action_list_box.add_child(new_entry)
			CARD_GLOBALS.CARD_TYPE.LOCATION:
				location_list_box.add_child(new_entry)
			CARD_GLOBALS.CARD_TYPE.RESOURCE:
				resource_list_box.add_child(new_entry)
		
		new_entry.card_clicked.connect(on_card_clicked)
		all_entries.append(new_entry)

func on_card_clicked(clicked_card : card_content):
	emit_signal("card_clicked", clicked_card)
