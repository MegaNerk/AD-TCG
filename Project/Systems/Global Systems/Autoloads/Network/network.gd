extends Node

signal steam_state_changed(new_state : Dictionary)

const PACKET_READ_LIMIT : int = 32

var max_lobby_members : int = 4
var lobby_data : Dictionary = {
	"id" : 0,
	"members" : []
}

var user_data : Dictionary = {
	"id" : 0,
	"name" : ""
}

var steam_state : Dictionary = {}

#region Setup
func _ready():
	attempt_steam()
	Steam.join_requested.connect(_on_lobby_join_requested)
	Steam.lobby_chat_update.connect(_on_lobby_chat_update)
	Steam.lobby_created.connect(_on_lobby_created)
	Steam.lobby_data_update.connect(_on_lobby_data_update)
	Steam.lobby_invite.connect(_on_lobby_invite)
	Steam.lobby_joined.connect(_on_lobby_joined)
	Steam.lobby_match_list.connect(_on_lobby_match_list)
	Steam.lobby_message.connect(_on_lobby_message)
	Steam.persona_state_change.connect(_on_persona_change)

func _process(_delta: float) -> void:
	Steam.run_callbacks()

func attempt_steam():
	print("Attempting to initialize Steam...")
	steam_state = Steam.steamInitEx()
	var steam_init_response : String = ""
	match steam_state["status"]:
		0:
			steam_init_response = "Initialized"
		1:
			steam_init_response = "Failed"
		2:
			steam_init_response = "Could not connect"
		3:
			steam_init_response = "Out of date client"
	print("Steam status: %s" %steam_init_response)
	emit_signal("steam_state_changed", steam_state)
	sync_user_data()

func sync_user_data():
	user_data["id"] = Steam.getSteamID()
	user_data["name"] = Steam.getPersonaName()
	print("User data synced:\nID: %s\nUsername:  %s" %[user_data["id"],user_data["name"]])

func sync_lobby_members():
	lobby_data["members"].clear()
	if lobby_data["id"] != 0:
		var num_members : int = Steam.getNumLobbyMembers(lobby_data["id"])
		for this_member in range(0,num_members):
			var member_id : int = Steam.getLobbyMemberByIndex(lobby_data["id"], this_member)
			var member_name : String = Steam.getFriendPersonaName(member_id)
			lobby_data["members"].append({"steam_id" : member_id, "steam_name" : member_name})
#endregion Setup

#region Behavior
func create_lobby():
	if lobby_data["id"] == 0:
		Steam.createLobby(Steam.LOBBY_TYPE_PRIVATE, max_lobby_members)

func close_lobby():
	pass

func leave_lobby():
	if lobby_data["id"] != 0:
		Steam.leaveLobby(lobby_data["id"])
		for member in lobby_data["members"]:
			if member["id"] != user_data["id"]:
				Steam.closeP2PSessionWithUser(member["id"])
		lobby_data["members"].clear()
		lobby_data["id"] = 0
		print("Left lobby")
#endregion

#region Steam Signal Connections
func _on_lobby_join_requested():
	pass

func _on_lobby_chat_update():
	pass

func _on_lobby_created(status : int, new_lobby_id : int):
	if status == Steam.RESULT_OK:
		lobby_data["id"] = new_lobby_id
		print("Successfully created lobby with ID: %s" %new_lobby_id)
		
		#Establish steam as a backup packet relay in case of firewall issues
		var relay_active : bool = Steam.allowP2PPacketRelay(true)
		print("Packet relay backup status: %s" %relay_active)
	else: print("Failed to create and join lobby - Error code: %s" %status)

func _on_lobby_data_update():
	sync_lobby_members()

func _on_lobby_invite():
	pass

func _on_lobby_joined():
	sync_lobby_members()

func _on_lobby_match_list():
	pass

func _on_lobby_message():
	pass

func _on_persona_change():
	sync_lobby_members()
#endregion
