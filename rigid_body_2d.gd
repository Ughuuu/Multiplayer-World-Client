class_name RigidBodySync
extends RigidBody2D

@export var position_server: Vector2

func _integrate_forces(state: PhysicsDirectBodyState2D):
	if Multiplayer.role == Multiplayer.Role.CLIENT:
		state.transform.origin = position_server

func _ready():
	if Multiplayer.role == Multiplayer.Role.CLIENT:
		custom_integrator = true

func _physics_process(delta):
	if Multiplayer.role == Multiplayer.Role.HOST:
		position_server = PhysicsServer2D.body_get_state(self, PhysicsServer2D.BODY_STATE_TRANSFORM).origin
