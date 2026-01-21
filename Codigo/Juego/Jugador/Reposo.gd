extends Estado
@onready var jugador:CharacterBody3D = owner
func entrar():
	animacion.emit("Reposo")
	print("Estas quieto")
	
func actualizar_fisicas(delta:float):
	if not jugador.is_on_floor():
		jugador.velocity.y += jugador.get_gravity().y
	
	jugador.velocity.x = 0
	jugador.velocity.z = 0
	
	jugador.move_and_slide()
	
	if Input.get_vector("Izquierda", "Derecha", "Adelante","Atras") != Vector2.ZERO:
		cambio.emit("Moviendome")
		
	if Input.is_action_just_pressed("Salto"):
		cambio.emit("Salto")
