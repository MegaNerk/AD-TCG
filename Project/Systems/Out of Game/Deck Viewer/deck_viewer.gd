extends Node

signal back_pressed
@export var deck_editor_scene : PackedScene

func open_deck_editor(deck : deck_list):
	var new_editor = deck_editor_scene.instantiate()
	add_child(new_editor)
	new_editor.open_for_deck(deck)

func _on_back_pressed():
	emit_signal("back_pressed")

func _on_deck_clicked(clicked_deck : deck_list):
	open_deck_editor(clicked_deck)
