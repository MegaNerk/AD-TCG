extends Resource
class_name CARD_GLOBALS

enum CARD_TYPE {RESOURCE, UNIT, ACTION, LOCATION}
enum FACTION {SURVIVOR, APOCALYPSE}
enum RESOURCE_TYPE {FUEL, WEAPONS, MEDICINE, FOOD, FEAR, MAGIC, HUNGER, DEATH}

const LAYOUTS_DICT : Dictionary = {
	CARD_TYPE.RESOURCE : "res://Project/Systems/Global Systems/Cards/Card Defaults/resource_card.tscn",
	CARD_TYPE.UNIT : "res://Project/Systems/Global Systems/Cards/Card Defaults/unit_card.tscn",
	CARD_TYPE.ACTION : "res://Project/Systems/Global Systems/Cards/Card Defaults/action_card.tscn",
	CARD_TYPE.LOCATION : "res://Project/Systems/Global Systems/Cards/Card Defaults/location_card.tscn",
}

static func GET_LAYOUT_BY_TYPE(given_type : CARD_TYPE) -> PackedScene:
	var path = LAYOUTS_DICT.get(given_type,null)
	if path != null:
		return load(path)
	return null

const RESOURCE_ICONS : Dictionary = {
	RESOURCE_TYPE.FUEL : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons13.png"),
	RESOURCE_TYPE.WEAPONS : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons07.png"),
	RESOURCE_TYPE.MEDICINE : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons04.png"),
	RESOURCE_TYPE.FOOD : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons23.png"),
	
	RESOURCE_TYPE.FEAR : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons11.png"),
	RESOURCE_TYPE.MAGIC : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons17.png"),
	RESOURCE_TYPE.HUNGER : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons27.png"),
	RESOURCE_TYPE.DEATH : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons02.png"),
}

const FACTION_COLORS : Dictionary = {
	FACTION.SURVIVOR : Color(0.1,0.15,0.3), #Dark blue
	FACTION.APOCALYPSE : Color(0.01, 0.2, 0.01), #Dark green
}
