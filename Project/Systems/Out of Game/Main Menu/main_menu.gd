extends Control

signal decks_pressed
signal multiplayer_pressed
signal singleplayer_pressed
signal options_pressed

#region Button signals
func _on_singleplayer_pressed():
	emit_signal("singleplayer_pressed")

func _on_multiplayer_pressed():
	emit_signal("multiplayer_pressed")

func _on_options_pressed():
	emit_signal("options_pressed")

func _on_decks_pressed():
	visible = false
	emit_signal("decks_pressed")

func _on_quit_pressed():
	get_tree().quit()
#endregion
