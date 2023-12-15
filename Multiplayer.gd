extends Node

enum Role {HOST, CLIENT}
var role: Role

signal host_started()
signal clients_connected(client_count: int)

func _ready():
	multiplayer.connected_to_server.connect(_connected_to_server)
	multiplayer.peer_connected.connect(_peer_connected)

func _connected_to_server():
	print("client connected to server")

func _peer_connected(id: int):
	clients_connected.emit(multiplayer.get_peers().size())
	print("peer_connected" + str(id))

func _on_button_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(8080, 4)
	multiplayer.multiplayer_peer = peer
	host_started.emit()
	print("host started")
	role = Role.HOST


func _on_button_client_pressed(text: String):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(text, 8080)
	multiplayer.multiplayer_peer = peer
	print("client trying to connect")
	role = Role.CLIENT
