extends Timer

func _ready():
	Multiplayer.clients_connected.connect(_clients_connected)
	

func _clients_connected(clients: int):
	if clients == 1:
		start()
