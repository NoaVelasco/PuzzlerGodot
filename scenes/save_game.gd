extends Node2D

var name_game : Array 
# Habrá que guardar el nombre y unirlo para enviarlo.

# debe enviarse y recibirse como objeto json


func _input(event):
	print("has dado a la tecla")
	#print(event.as_text())
	
	name_game.append(event.as_text())
	
	print(name_game)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
