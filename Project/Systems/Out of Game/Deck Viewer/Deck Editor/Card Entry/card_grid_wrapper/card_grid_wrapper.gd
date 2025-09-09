extends Control

signal card_clicked(card_ref : card_content)

@export var card_scene : PackedScene

@export var wrapped_card : card

@export var highlight_panel : Panel

var mouse_hovering : bool = false:
	set(value):
		mouse_hovering = value
		highlight_panel.visible = value

func _ready():
	call_deferred("resize_card")
	if highlight_panel.get_global_rect().has_point(get_global_mouse_position()):
		highlight_panel.visible = true

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
	var new_scale = (size.x - 30) / wrapped_card.size.x
	var new_vec = Vector2(new_scale,new_scale)
	wrapped_card.position = Vector2(15,15)
	wrapped_card.scale = new_vec
	custom_minimum_size.y = (wrapped_card.size.y * new_scale) + 30

func _on_mouse_enter():
	mouse_hovering = true

func _on_mouse_exit():
	mouse_hovering = false

func _gui_input(event):
	if event is not InputEventMouseButton:
		return
	
	if mouse_hovering and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("card_clicked", wrapped_card.card_data)
