extends Estado

const VEL = 20
const SAL:float = 500.0


@onready var jugador:CharacterBody3D = owner
@onready var camara:Camera3D = $"../../SpringArm3D/Camera3D"

func entrar():
	print("Estas moviendote")
	
func actualizar_fisicas(delta:float):
	
	if not jugador.is_on_floor():
		jugador.velocity.y += jugador.get_gravity().y * delta
	else:
		jugador.velocity.y = 0
	
	var direccion_input:Vector2 = Input.get_vector("Izquierda", "Derecha", "Adelante","Atras")
	
	var camara_z = camara.global_transform.basis.z
	var camara_x = camara.global_transform.basis.x
	
	camara_z.y = 0
	camara_x.y = 0
	
	var direccion:Vector3 = Vector3(camara_x * direccion_input.x) + (camara_z * direccion_input.y)
	var movimiento = direccion * VEL
	jugador.velocity = Vector3(movimiento.x, jugador.velocity.y ,movimiento.z)
	
	if Input.is_action_just_pressed("Salto") and jugador.is_on_floor():
		cambio.emit("Salto")
	
	
	jugador.move_and_slide()

	
