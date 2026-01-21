extends SpringArm3D

@onready var jugador = owner
const SENS = 0.001

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.x -= -event.relative.y * SENS
		jugador.rotation.y -= -event.relative.x * SENS
		
		rotation.x = clamp(rotation.x, -PI/4, PI/2)
		

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
