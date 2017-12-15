extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Jogar_pressed():
	get_tree().change_scene("res://cenas/Jogo.tscn")
	
func _on_Sair_pressed():
	get_tree().quit()
	
