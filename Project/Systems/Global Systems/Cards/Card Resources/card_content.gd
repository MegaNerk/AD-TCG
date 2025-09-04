extends Resource
class_name card_content

enum CARD_TYPE {RESOURCE, UNIT, ACTION, LOCATION}
enum FACTION {SURVIVOR, APOCALYPSE}
enum RESOURCE_TYPE {FUEL, WEAPONS, MEDICINE, FOOD}

@export var layout : PackedScene

@export var image : Texture
@export var name : String
@export var faction : FACTION
var type : CARD_TYPE
