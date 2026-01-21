extends Node3D

@onready var Maquina_estados = $"../MaquinaDeEstados"
var estados:Array

func _ready() -> void:
	estados = Maquina_estados.get_children()
	for estado in estados:
		estado.animacion.connect(mostrar_animacion)
		
func mostrar_animacion(animacion):
	$AnimationPlayer.play(animacion,0.5)
