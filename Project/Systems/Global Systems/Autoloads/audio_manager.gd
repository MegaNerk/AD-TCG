extends Node
var audio_player : AudioStreamPlayer

@export var button_pressed : AudioStream = load("res://Data/Assets/Sounds/94122__bmaczero__singlebullet1.wav")

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

func play_button_pressed():
	audio_player.stream = button_pressed
	audio_player.play()
