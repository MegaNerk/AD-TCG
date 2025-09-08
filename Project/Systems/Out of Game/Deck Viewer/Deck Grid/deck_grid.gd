extends ScrollContainer

var my_entries : Array = []

@export var deck_entry_scene : PackedScene

@onready var my_grid = $CenterContainer/GridContainer

signal deck_clicked(deck : deck_list)

func create_deck_entry(new_deck : deck_list):
	var new_entry = deck_entry_scene.instantiate()
	new_entry.my_deck = new_deck
	my_grid.add_child(new_entry)
	my_entries.append(new_entry)
	new_entry.deck_clicked.connect(_on_deck_entry_deck_clicked)

func remove_deck_entry(old_deck : deck_list):
	for entry_ in my_entries:
		if entry_.my_deck == old_deck:
			my_entries.erase(entry_)
			entry_.queue_free()
			break

func _on_deck_entry_deck_clicked(deck):
	emit_signal("deck_clicked", deck)
