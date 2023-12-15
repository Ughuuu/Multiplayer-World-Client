extends Node2D

@onready var circle: PackedScene = preload("res://rigid_body_2d.tscn")


func _on_timer_timeout():
	create_circle.rpc()

@rpc("any_peer", "call_local")
func create_circle():
	var new_object : RigidBody2D = circle.instantiate()
	new_object.linear_velocity = Vector2(randf(), randf())
	add_child(new_object)
