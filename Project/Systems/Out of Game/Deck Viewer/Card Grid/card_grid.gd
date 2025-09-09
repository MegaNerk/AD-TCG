extends Node
class_name card_grid

signal card_clicked(card_data_ref)

@export var card_grid_wrapper_scene : PackedScene

@export var my_grid : GridContainer

@export var grid_columns : int = 4:
	set(value):
		grid_columns = value
		my_grid.columns = grid_columns

func _ready():
	my_grid.columns = grid_columns

func add_card_entry(new_card_data : card_content):
	var new_entry = card_grid_wrapper_scene.instantiate()
	new_entry.take_card(new_card_data)
	my_grid.add_child(new_entry)
	new_entry.card_clicked.connect(func(data_ref):emit_signal("card_clicked", data_ref))
