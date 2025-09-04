extends card_content
class_name action_content

@export var my_cost : card_cost
@export var my_effect : card_effect

func _init():
	type = CARD_TYPE.ACTION
