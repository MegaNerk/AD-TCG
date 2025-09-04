@tool
extends Control

@onready var name_label = $MarginContainer/VBoxContainer/HBoxContainer/Name
@onready var image_slot = $MarginContainer/VBoxContainer/TextureRect

@export var card_data : card_content:
	set(value):
		card_data = value
		load_layout()

var my_layout

func _ready():
	load_layout()

func load_layout():
	for child_ in get_children():
		child_.queue_free()
	
	if card_data != null:
		my_layout = card_data.layout.instantiate()
		add_child(my_layout)

func populate_layout():
	pass
