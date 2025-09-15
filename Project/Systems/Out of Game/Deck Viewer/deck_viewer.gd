extends Node

signal back_pressed
@export var deck_editor_scene : PackedScene
@export var my_deck_grid : Control

@export var confirmation_popup : confirm_popup

var displayed_decks : Array[deck_list] = []

func _ready():
	load_deck_entries()
	DECKS.decks_loaded.connect(load_deck_entries)

func open_deck_editor(deck : deck_list):
	var new_editor = deck_editor_scene.instantiate()
	add_child(new_editor)
	new_editor.open_for_deck(deck)

func _on_back_pressed():
	emit_signal("back_pressed")

func _on_deck_clicked(clicked_deck : deck_list):
	if confirmation_popup.visible:
		return
	open_deck_editor(clicked_deck)

func _on_deck_right_clicked(clicked_deck : deck_list):
	if confirmation_popup.visible:
		return
	confirmation_popup.visible = true
	confirmation_popup.prompt_text = "Delete %s?" %[clicked_deck.get_deck_name()]
	confirmation_popup.confirmed.connect(_confirm_delete_deck.bind(clicked_deck))

func _confirm_delete_deck(confirmation : bool, deck_to_delete : deck_list):
	confirmation_popup.visible = false
	confirmation_popup.confirmed.disconnect(_confirm_delete_deck)
	if confirmation:
		DECKS.delete_deck(deck_to_delete)

func load_deck_entries():
	my_deck_grid.clear_entries()
	for deck_ in DECKS.all_decks.values():
		my_deck_grid.create_deck_entry(deck_)
