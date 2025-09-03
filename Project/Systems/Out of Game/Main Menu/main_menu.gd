extends Control

signal decks_pressed

#region Button signals
func _on_decks_pressed():
	visible = false
	emit_signal("decks_pressed")

func _on_quit_pressed():
	get_tree().quit()
#endregion
