extends Control

@onready var name_back_plate = $Panel/HBoxContainer/Control
@onready var card_name_label = $Panel/HBoxContainer/Control/NameLabel
@onready var count_label = $Panel/HBoxContainer/TextureRect/MarginContainer/CountLabel

var this_card : card
var count : int = 0

func populate(entered_card : card):
	this_card = entered_card
	count = 1
	set_entry_name(entered_card.get_card_name())
	count_label = str(count)

func _ready():
	call_deferred("fit_text")

func add_copy():
	count += 1
	count_label = str(count)

func remove_copy():
	count -= 1
	count_label = str(count)
	if count < 1:
		queue_free()

#region Text
func set_entry_name(name : String):
	card_name_label.text = name
	call_deferred("fit_text")

func fit_text():
	var font_size : int = card_name_label.get_theme_font_size("font_size") + 25
	while does_text_fit(font_size) == false:
		font_size -= 1
	card_name_label.add_theme_font_size_override("font_size", font_size)

#Helper method for dynamically adjusting font size
func does_text_fit(font_size : int) -> bool:
	var font = card_name_label.get_theme_font("font")
	return font.get_string_size(card_name_label.text, HORIZONTAL_ALIGNMENT_CENTER, -1, font_size).x < name_back_plate.size.x - 15\
	and font.get_string_size(card_name_label.text, HORIZONTAL_ALIGNMENT_CENTER, -1, font_size).y < name_back_plate.size.y - 5
#endregion
