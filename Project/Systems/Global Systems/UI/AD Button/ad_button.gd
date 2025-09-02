extends Button
class_name AD_Button

func _ready():
	button_down.connect(_on_button_pressed)

func _on_button_pressed():
	AUDIO.play_button_pressed()
