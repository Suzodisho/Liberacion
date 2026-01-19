extends Node
class_name MaquinaDeEstados

var estados:Dictionary
@export var estado_inicial:Estado
var estado_actual:Estado

func _ready() -> void:
	for estado in get_children():
		if estado is Estado:
			estados[estado.name.to_upper()] = estado
			estado.cambio.connect(cambiar_estado)
		else:
			estado.queue_free()
	if estado_inicial:
		estado_inicial.entrar()
		estado_actual = estado_inicial
		
func _process(delta: float) -> void:
	if estado_actual:
		estado_actual.actualizar(delta)
		
func _physics_process(delta: float) -> void:
	if estado_actual:
		estado_actual.actualizar_fisicas(delta)
		
func cambiar_estado(nombre_estado:String):
	var nuevo_estado = estados.get(nombre_estado.to_upper())
	if not nuevo_estado or nuevo_estado == estado_actual:
		return
	else:
		estado_actual.salir()
		estado_actual = nuevo_estado
		estado_actual.entrar()
