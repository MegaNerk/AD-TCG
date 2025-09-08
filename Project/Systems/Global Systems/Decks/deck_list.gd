extends Node
class_name deck_list

var deck_name : String = ""
var cards : Dictionary = {}#The cards in this deck - card_content : count

func add_card(new_card : card_content):
	if new_card not in cards.keys():
		cards[new_card] = 1
	else: cards[new_card] += 1

func remove_card(old_card : card_content):
	if !cards.has(old_card):
		return
	cards[old_card] -= 1
	if cards[old_card] < 1:
		cards.erase(old_card)

func change_name(new_name : String):
	deck_name = new_name

func get_deck_name() -> String:
	return deck_name

func get_cards() -> Dictionary:
	return cards
