extends Node

signal back_pressed
@export var deck_editor_scene : PackedScene
@export var my_deck_grid : Control

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
	open_deck_editor(clicked_deck)

func load_deck_entries():
	my_deck_grid.clear_entries()
	for deck_ in DECKS.all_decks.values():
		my_deck_grid.create_deck_entry(deck_)
