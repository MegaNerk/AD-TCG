extends Control
class_name card_layout

@export var name_plate : Label = null
@export var card_art_slot : TextureRect = null
@export var body_text_plate : RichTextLabel = null
@export var cost_slot : card_cost_ui = null
@export var combat_slot : combat_icons = null
@export var card_bg : TextureRect = null

func set_up_card_layout(content : card_content):
	if name_plate != null and content.get_card_name() != null:
		name_plate.text = content.get_card_name()
	
	if card_art_slot != null and content.get_image() != null:
		card_art_slot.texture = content.get_image()
	
	if body_text_plate != null:
		body_text_plate.text = content.get_effect_text()
	
	if cost_slot != null and content.get_cost() != null:
		cost_slot.build(content.get_cost())
	
	if combat_slot != null and content.get_combat_stats() != null:
		combat_slot.build(content.get_combat_stats())
	
	if card_bg != null:
		var border_color = CARD_GLOBALS.FACTION_COLORS.get(content.faction, Color.WHITE)
		card_bg.material.set_shader_parameter("border_color", border_color)

#region Outside access
func change_body_text(new_text : String):
	if body_text_plate != null:
		body_text_plate.text = new_text

func get_body_text() -> String:
	if body_text_plate != null:
		return body_text_plate.text
	return ""
#endregion
