extends "res://Scripts/itens.gd" # herda tudo do script itens

func _ready():
	pass

func _on_Banana_area_enter(Node2D):
	var pai=get_parent()
	if Node2D.get_name()=="area_lixo":
		pai.pontuacao(1)
		self.hide()
		self.queue_free()
	
	if Node2D.get_name()=="area_azul":
		pai.saude(-10)
		self.hide()
		self.queue_free()
		
	if Node2D.get_name()=="area_verde":
		pai.saude(-10)
		self.hide()
		self.queue_free()
		
	if Node2D.get_name()=="area_amarela":
		pai.saude(-10)
		self.hide()
		self.queue_free()
	