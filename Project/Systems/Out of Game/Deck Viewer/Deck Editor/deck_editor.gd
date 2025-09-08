extends Control

@export var deck_list_box : VBoxContainer
@export var unit_list_box : VBoxContainer
@export var action_list_box : VBoxContainer
@export var location_list_box : VBoxContainer
@export var resource_list_box : VBoxContainer

func open_for_deck(new_deck : deck_list):
	if new_deck == null:
		new_deck = deck_list.new()
