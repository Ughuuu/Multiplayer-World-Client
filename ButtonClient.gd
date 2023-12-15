extends Button

@export var line_edit: LineEdit

func _on_pressed():
	Multiplayer._on_button_client_pressed(line_edit.text)
