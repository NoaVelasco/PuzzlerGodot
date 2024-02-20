extends Node2D

@export var path = "res://scenes/save_game.tscn"
# necesito la ruta del pad guardar con el input para meter el nombre


func _input(event):
	print("has dado a la tecla")
	print(event.as_text())
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_guardar_pressed():
	get_tree().change_scene_to_file(path)
	
