extends Node

class_name Estado
var control = owner

@warning_ignore("unused_signal")
signal cambio(nombre)
@warning_ignore("unused_signal")
signal animacion(nombre)

func entrar():
	pass
	
func salir():
	pass
	
@warning_ignore("unused_parameter")
func actualizar_fisicas(delta:float):
	pass
	
@warning_ignore("unused_parameter")
func actualizar(delta:float):
	pass
