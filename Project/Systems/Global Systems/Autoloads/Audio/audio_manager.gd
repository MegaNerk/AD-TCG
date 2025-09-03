extends Node
var audio_player : AudioStreamPlayer

@export var all_sounds : Array[sound_entry]

@onready var music_player = $MusicPlayer
@onready var sfx_players = [$SFXPool/SFXPlayer1,$SFXPool/SFXPlayer2,$SFXPool/SFXPlayer3,$SFXPool/SFXPlayer4]

var sfx_dict : Dictionary = {}

func _ready():
	for entry in all_sounds:
		sfx_dict[entry.name] = entry.audio

func play_button_pressed():
	sfx_players[1].stream = sfx_dict["Button_Clicked"]
	sfx_players[1].play()
