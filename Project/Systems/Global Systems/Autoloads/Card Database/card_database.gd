extends Node
class_name card_database

var default_path : String = "res://Project/Systems/Global Systems/Cards/All Cards/"

var all_cards : Dictionary = {

}

func _ready():
	load_all_cards()

func load_all_cards():
	all_cards.clear()
	var base_dir = DirAccess.open("res://Project/Systems/Global Systems/Cards/All Cards/")
	assert(base_dir, "Non-existent directory for card database")
	load_cards_from_dir(default_path)

func load_cards_from_dir(path : String):
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var next_file = dir.get_next()
	while next_file != "":
		if dir.current_is_dir():
			load_cards_from_dir(path + next_file + "/")
		else:
			var next_card : card_content = load(path+next_file)
			if next_card:
				all_cards[next_card.get_card_name()] = next_card
		next_file = dir.get_next()
	dir.list_dir_end()
		#Base case:
		#Iterate through all resources, add them to the all_cards dict
		#Recursive case:
