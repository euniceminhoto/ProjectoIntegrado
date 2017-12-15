extends Node2D
var is_inside=false

func _ready():
	set_process(true)

func _process(delta):
	if is_inside:
		self.set_pos(Vector2(get_global_mouse_pos().x,get_global_mouse_pos().y))



func _on_Area2D_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("left_click"):
		is_inside=true
		print("inside")
	if event.is_action_released("left_click"):
		is_inside=false
		print("outside")


func _on_KinematicBody2D_2_body_enter_shape( body_id, body, body_shape, local_shape ):
	print("entrou")


func _on_Area2D_area_enter( area ):
	if
	print("ENTROUUUUUU")
