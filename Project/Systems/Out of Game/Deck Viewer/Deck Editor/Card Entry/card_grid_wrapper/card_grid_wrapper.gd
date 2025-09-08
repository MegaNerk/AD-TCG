extends Control

@export var card_scene : PackedScene

@export var wrapped_card : card

func _ready():
	call_deferred("resize_card")

func take_card(new_card_content : card_content):
	if wrapped_card != null:
		wrapped_card.queue_free()
	wrapped_card = card_scene.instantiate()
	wrapped_card.card_data = new_card_content
	add_child(wrapped_card)
	call_deferred("resize_card")

func resize_card():
	if wrapped_card == null:
		return
	var new_scale = size.x / wrapped_card.size.x
	wrapped_card.scale.x = new_scale
	wrapped_card.scale.y = new_scale
	custom_minimum_size.y = wrapped_card.size.y * new_scale
