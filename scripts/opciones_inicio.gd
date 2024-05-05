extends Node2D

var path = "res://scenes/pantalla_inicio.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/volver.grab_focus()


func _on_volver_pressed():
	get_tree().change_scene_to_file(path)
