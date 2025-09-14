extends Node
class_name deck_manager

signal decks_loaded

var deck_save_path = "user://decks/"

var all_decks : Dictionary = {} #name : deck_list

func _ready():
	_load_decks()
	
func _load_decks():
	all_decks = {}
	DirAccess.make_dir_recursive_absolute(deck_save_path)
	var dir = DirAccess.open(deck_save_path)
	dir.list_dir_begin()
	var next_file = dir.get_next()
	while next_file != "":
		var this_deck = FileAccess.open(deck_save_path + next_file, FileAccess.READ)
		var deck_dict = JSON.parse_string(this_deck.get_as_text())
		var deck_entry = deck_list.new()
		deck_entry.load_from_saved_deck(deck_dict)
		deck_entry.file_name = next_file
		all_decks[deck_entry.get_deck_name()] = deck_entry
		next_file = dir.get_next()
	dir.list_dir_end()
	emit_signal("decks_loaded")

func create_new_deck() -> deck_list:
	DirAccess.make_dir_recursive_absolute(deck_save_path)
	var new_deck = deck_list.new()
	new_deck.change_name(get_unique_file_name(new_deck.get_deck_name()))
	var deck_name = new_deck.get_deck_name()
	new_deck.file_name = "%s.json" % [deck_name]
	var new_save = FileAccess.open(deck_save_path + "%s.json" % [deck_name],FileAccess.WRITE)
	var save_data : Dictionary = new_deck.make_savable_dict()
	new_save.store_string(JSON.stringify(save_data, "\t"))
	new_save.close()
	_load_decks()
	return new_deck

func update_deck(deck_to_update : deck_list):
	var old_deck_path : String = deck_save_path + deck_to_update.file_name
	var new_deck_path : String = deck_save_path + "%s.json" %[deck_to_update.get_deck_name()]
	assert(FileAccess.file_exists(old_deck_path), "Could not find deck at path: " + old_deck_path)
	if old_deck_path != new_deck_path:
		var new_name = get_unique_file_name(deck_to_update.get_deck_name())
		deck_to_update.change_name(new_name)
		new_deck_path = deck_save_path + "%s.json" %[deck_to_update.get_deck_name()]
		DirAccess.rename_absolute(old_deck_path, new_deck_path)
		deck_to_update.file_name = "%s.json" %[new_name]
	var deck_file = FileAccess.open(new_deck_path, FileAccess.WRITE)
	var save_data : Dictionary = deck_to_update.make_savable_dict()
	deck_file.store_string(JSON.stringify(save_data, "\t"))
	deck_file.close()
	_load_decks()

#Helper method to ensure that file names are unique and not overwriting existing files
func get_unique_file_name(base_name : String, directory : String = deck_save_path) -> String:
	var count = 1
	var final_name = base_name
	while FileAccess.file_exists(directory + "%s.json" % [final_name]):
		final_name = base_name + "(%s)" % [str(count)]
		count += 1
	return final_name

func get_deck_with_name(deck_name : String) -> deck_list:
	return all_decks.get(deck_name, null)
