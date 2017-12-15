extends "res://scripts/itens.gd" # herda tudo do script itens

func _ready():
	pass


func _on_Cereais_area_enter( e ):
	var pai=get_parent()
	if e.get_name()=="area_azul":
		pai.pontuacao(1)
		self.hide()
		self.queue_free()
	
	if e.get_name()=="area_amarela":
		pai.saude(-10)
		self.hide()
		self.queue_free()
		
	if e.get_name()=="area_verde":
		pai.saude(-10)
		self.hide()
		self.queue_free()
		
	if e.get_name()=="area_lixo":
		pai.saude(-10)
		self.hide()
		self.queue_free()