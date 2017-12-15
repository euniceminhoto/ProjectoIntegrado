extends Area2D

var speed=50 #queda velocidade aleatória
var velocidade_max=100 #queda velocidade aleatória
var velocidade_min=50 #queda velocidade aleatória

var esquerda=0 #queda aleatória definir intervalo para não cortar itens
var direita=0 #queda aleatória definir intervalo para não cortar itens
var largura=Globals.get("display/width") #queda aleatória definir intervalo para não cortar itens
var altura=Globals.get("display/height") #queda aleatória definir intervalo para não cortar itens

var altura_imagem

var saida_tela

func _ready(): #queda velocidade aleatória
	set_fixed_process(true)
	randomize()
	speed=rand_range(velocidade_min, velocidade_max)
	
	esquerda=get_largura_imagem()/2 #queda aleatória definir intervalo para não cortar itens
	direita=largura - (get_largura_imagem()/2) #queda aleatória definir intervalo para não cortar itens
	
	var x_aleatorio=rand_range(esquerda,direita) #queda aleatória definir intervalo para não cortar itens
	set_pos(Vector2(x_aleatorio,-32)) #queda aleatória definir intervalo para não cortar itens
	
	altura_imagem=get_altura_imagem()
	
func _fixed_process(delta): #queda velocidade aleatória
	translate(Vector2(0,speed)*delta)
	if (get_pos().y - altura_imagem/2 > altura): #libertar espaço da memória quando o item passa o ecran
		self.queue_free() #libertar espaço da memória quando o item passa o ecran, é eliminado
		

func get_largura_imagem(): #queda aleatória definir intervalo para não cortar itens
	var im= get_node("Sprite") #apanha a sprite
	var imagem=im.get_texture()#apanha a imagem carregada na sprite
	return imagem.get_width()#mede o tamanho da imagem
	
func get_altura_imagem(): #libertar espaço da memória quando o item passa o ecran
	var im= get_node("Sprite") 
	var imagem=im.get_texture()
	return imagem.get_height()