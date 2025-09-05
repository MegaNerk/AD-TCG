extends Resource
class_name CARD_GLOBALS

enum CARD_TYPE {RESOURCE, UNIT, ACTION, LOCATION}
enum FACTION {SURVIVOR, APOCALYPSE}
enum RESOURCE_TYPE {FUEL, WEAPONS, MEDICINE, FOOD, FEAR, MAGIC, HUNGER, DEATH}

const LAYOUTS_DICT : Dictionary = {
	CARD_TYPE.RESOURCE : preload("res://Project/Systems/Global Systems/Cards/Card Defaults/resource_card.tscn"),
	CARD_TYPE.UNIT : preload("res://Project/Systems/Global Systems/Cards/Card Defaults/unit_card.tscn"),
	CARD_TYPE.ACTION : preload("res://Project/Systems/Global Systems/Cards/Card Defaults/action_card.tscn"),
	CARD_TYPE.LOCATION : preload("res://Project/Systems/Global Systems/Cards/Card Defaults/location_card.tscn"),
}

const RESOURCE_ICONS : Dictionary = {
	RESOURCE_TYPE.FUEL : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons13.png"),
	RESOURCE_TYPE.WEAPONS : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons24.png"),
	RESOURCE_TYPE.MEDICINE : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons04.png"),
	RESOURCE_TYPE.FOOD : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons23.png"),
	
	RESOURCE_TYPE.FEAR : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons11.png"),
	RESOURCE_TYPE.MAGIC : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons17.png"),
	RESOURCE_TYPE.HUNGER : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons27.png"),
	RESOURCE_TYPE.DEATH : preload("res://Data/Assets/Art/Osmic/Separated/zombie_icons26.png"),
}

const FACTION_COLORS : Dictionary = {
	FACTION.SURVIVOR : Color(0.1,0.15,0.3), #Dark blue
	FACTION.APOCALYPSE : Color(0.01, 0.2, 0.01), #Dark green
}
