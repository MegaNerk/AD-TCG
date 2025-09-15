@tool
extends Control
class_name confirm_popup

signal confirmed(state : bool)

@export var prompt_text : String:
	set(value):
		prompt_text = value
		if prompt_label:
			prompt_label.text = prompt_text

@export var confirm_text : String:
	set(value):
		confirm_text = value
		if confirm_button:
			confirm_button.text = confirm_text

@export var decline_text : String:
	set(value):
		decline_text = value
		if decline_button:
			decline_button.text = decline_text

@export var prompt_label : Label
@export var confirm_button : AD_Button
@export var decline_button : AD_Button

func _on_confirm_pressed():
	emit_signal("confirmed", true)

func _on_decline_pressed():
	emit_signal("confirmed", false)
