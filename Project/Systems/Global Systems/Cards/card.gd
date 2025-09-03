@tool
extends Panel

@onready var name_label = $MarginContainer/VBoxContainer/Name
@onready var image_slot = $MarginContainer/VBoxContainer/TextureRect
@onready var body_text = $MarginContainer/VBoxContainer/RichTextLabel

@export var card_data : card_content:
	set(value):
		card_data = value
		sync_to_data()

func sync_to_data():
	pass

func resize_text():
	pass
