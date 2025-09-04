extends card_content
class_name location_content

@export var my_cost : card_cost
@export var my_effect : card_effect
@export var my_stats : card_combat

func _init():
	type = CARD_TYPE.LOCATION
