extends Control

@onready var name_label = $MarginContainer/VBoxContainer/HBoxContainer/Name
@onready var image_slot = $MarginContainer/VBoxContainer/TextureRect

@export var card_data : card_content:
	set(value):
		card_data = value

var my_layout : card_layout

func _init(new_data : card_content = card_data):
	card_data = new_data

func _ready():
	load_layout()
	my_layout.combat_slot.atk_value += 10
	my_layout.combat_slot.def_value -= 1

func load_layout():
	for child_ in get_children():
		child_.queue_free()
	
	if card_data != null:
		my_layout = card_data.layout.instantiate()
		add_child(my_layout)
		my_layout.set_up_card_layout(card_data)
