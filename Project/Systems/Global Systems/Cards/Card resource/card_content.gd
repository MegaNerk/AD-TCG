extends Resource
class_name card_content

enum CARD_TYPE {RESOURCE, UNIT, ACTION, LOCATION, BUILDING}
enum FACTION {SURVIVOR, APOCALYPSE}
enum RESOURCE_TYPE {FUEL, WEAPONS, MEDICINE, FOOD}

@export var image : Texture
@export var name : String
@export var body : String
@export var faction : FACTION
@export var type : CARD_TYPE
@export var fuel_cost : int
@export var weapons_cost : int
@export var medicine_cost : int
@export var food_cost : int
