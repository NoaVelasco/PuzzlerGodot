extends Node2D

const SAVE_FILE_PATH = "user://game_save.save"

@onready var save_button = $ColorRect/Control/Panel/Save
@onready var back_button = $ColorRect/Control/Panel/Back
# @onready var name_game = $ColorRect/Control/Panel/TextEdit

# podriamos guardar el nivel en que se encuentra

func _ready():
	save_button.button_up.connect(save_game)
	back_button.button_up.connect(back)
	
func save_game():
	print("guardamos")
	# print(name_game.text)
	var save_data = {}
	# save_data.text = name_game.text
	# para recuperar podriamos concatenar usuario y name_game
	# si voy a recuperar otra información como el nivel, si es un int, necesitaria castearlo, ej:
	
	# save_data.level = var_to_str(info.level)
	
	# y así todas los datos que necesito
	
	
	
	# para guardarlo, tengo que ver la ruta con firebase, establecerlo como un path
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	if save_file == null:
		print("ERROR SAVE FILE", FileAccess.get_open_error())
		return
	
	# una vez tengo la ruta, el datoa  enviar tiene que ser un json:
	var json_data = JSON.stringify(save_data)
	save_file.store_string(json_data)
	
	
func back():
	# Como hago el regreeso? como pausa o como una nueva redirección.
	# una nueva redirección iria a la escena desde inicio
	pass
	

	

'''

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

'''
