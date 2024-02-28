extends Node2D

@onready var popup = $Window
@onready var save_button = $Window/ColorRect/Control/Panel/Save



# Called when the node enters the scene tree for the first time.
func _ready():
	save_button.grab_focus()
	popup.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		
		# Pausa debe dejar mover el menú
		print("abro menu ")
		get_tree().paused = true
		popup.show()
		
		if get_tree().paused == true:
			popup.show()
			
		save_button.grab_focus()



func _on_window_close_requested():
	popup.hide()


func _on_back_pressed():
	print("volver")
	get_tree().paused = false
	popup.hide()



func _on_save_pressed():
	get_tree().change_scene_to_file("res://scenes/saveGame.tscn")
	


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://scenes/pantalla_inicio.tscn")
	
