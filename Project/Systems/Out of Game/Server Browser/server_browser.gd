extends Node
signal back_pressed
signal create_pressed

func _on_back_pressed():
	emit_signal("back_pressed")

func _on_create_pressed():
	emit_signal("create_pressed")
	NETWORK.create_lobby()

func _on_server_clicked(server_ref):
	pass
