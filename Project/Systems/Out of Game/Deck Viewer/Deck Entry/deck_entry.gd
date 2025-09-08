@tool
extends Node

signal deck_clicked(deck : deck_list)

var my_deck : deck_list = null:
	set(value):
		my_deck = value
		label_text = my_deck.get_deck_name()

@onready var deck_label = $MarginContainer/VBoxContainer/Label
@onready var deck_texture = $MarginContainer/VBoxContainer/Panel/MarginContainer/TextureRect

@export var label_text : String:
	set(value):
		label_text = value
		change_label_text(label_text)

func _ready():
	change_label_text(label_text)
	
func change_label_text(new_text : String):
	if deck_label != null:
		deck_label.text = new_text

func _on_pressed():
	emit_signal("deck_clicked", my_deck)
