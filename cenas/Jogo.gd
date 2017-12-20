extends Node

var cereais_resourse
var oleo_resourse
var vidro_resourse
var banana_resourse

var saida_tela=0

var pontuacao=0

var saude=100

var tempo = 30

func _ready():
	set_process(true)
	pass
	
func _process(delta):

	get_node("Label").set_text(str("%d" % tempo))   
	tempo -= delta
	
	cereais_resourse=load("res://cenas/Cereais.tscn")
	oleo_resourse=load("res://cenas/Oleo.tscn")
	vidro_resourse=load("res://cenas/Vidro.tscn")
	banana_resourse=load("res://cenas/Banana.tscn")
	
	var cereais
	cereais_resourse=load("res://cenas/cereais.tscn")
	#cereais=cereais_resourse.instance()  mais do que um objecto por cena
	
	var banana
	banana_resourse=load("res://cenas/banana.tscn")
	#banana=banana_resourse.instance()
	
	var oleo
	oleo_resourse=load("res://cenas/Oleo.tscn")
	#oleo=oleo_resourse.instance()
	
	
	var vidro
	vidro_resourse=load("res://cenas/Vidro.tscn")
	#vidro=vidro_resourse.instance()
	


func _on_Cereais_timer_timeout():
	var cereais=cereais_resourse.instance()
	add_child(cereais)

func _on_Banana_timer_timeout():
	var banana=banana_resourse.instance()
	add_child(banana)

func _on_Oleo_timer_timeout():
	var oleo=oleo_resourse.instance()
	add_child(oleo)

func _on_Vidro_timer_timeout():
	var vidro=vidro_resourse.instance()
	add_child(vidro)

func _saida_tela():
	if (get_pos().y > 600):
		saida_tela=saida_tela+1
		print("saida_tela")

func pontuacao(pontos):
	pontuacao=pontuacao+pontos
	var score=get_node("score")
	var scoref=get_node("Score/score1")
	score.set_text(str(pontuacao))
	scoref.set_text(str(pontuacao))
	
func saude(valor):
	saude=saude+valor
	var barra_vida=get_node("barra_vida")
	barra_vida.set_value(saude)
	gameover()
	
	
func gameover():
	if saude <=0:
		var popup=get_node("Gameover")
		popup.popup_centered()
		get_tree().set_pause(true)

func _on_menu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://cenas/menu.tscn")
	
func _on_sair_pressed():
	get_tree().quit()


func _on_Timer_timeout():
	var popup1=get_node("Score")
	popup1.popup_centered()
	get_tree().set_pause(true)
	#var pontos=get_node("Score")
	#score.set_text(str("resultado"))
	#get_node("Score.resultado").set_text(str(pontuacao))
	
# sincronizar codigo com o repositorio gitub