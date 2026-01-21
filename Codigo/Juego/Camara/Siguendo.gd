extends Estado

var orbital = owner


func entrar():
	print("Camara siguiendo")
	
func actualizar_fisicas(delta:float):
	orbital.position = orbital.objetivo.position
