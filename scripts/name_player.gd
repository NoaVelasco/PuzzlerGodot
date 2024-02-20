extends Node2D

const SAVE_FILE_PATH = "user://game_save.save"

# como va a ser la primera partida, va a ir al loading inicial
@export var path = "res://scenes/loading.tscn"

@onready var continue_button = $ColorRect/Control/Panel/continuar
@onready var back_button = $ColorRect/Control/Panel/back
@onready var name_player = $ColorRect/Control/Panel/name_player

# podriamos guardar el nivel en que se encuentra

func _ready():
	name_player.grab_focus()
	continue_button.button_up.connect(start_game)
	back_button.button_up.connect(back)
	
func start_game():
	# esto debería llevar al primer nivel, o primero al loading
	print("se iniciará la partida")
	print(name_player.text)
	var save_data = {}
	save_data.text = name_player.text
	
	# Se asigna al nombre del jugador, y se mostrará en pantalla
	GLOBAL.name_player = name_player.text
	
	print("ahora save_data que es lo que voy a enviar")
	print(save_data.text)
	
	print("Nombre en global:")
	print(GLOBAL.name_player)
	
	# Y redirige al loading y al primer nivel
	get_tree().change_scene_to_file(path)
	# para recuperar podriamos concatenar usuario y name_game
	# si voy a recuperar otra información como el nivel, si es un int, necesitaria castearlo, ej:
	
	# save_data.level = var_to_str(info.level)
	
	# y así todas los datos que necesito
	
	
	
	# para guardarlo, tengo que ver la ruta con firebase, establecerlo como un path
	'''
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	if save_file == null:
		print("ERROR SAVE FILE", FileAccess.get_open_error())
		return
	
	# una vez tengo la ruta, el datoa  enviar tiene que ser un json:
	var json_data = JSON.stringify(save_data)
	save_file.store_string(json_data)
	
	'''
	
	
func back():
	# Como hago el regreeso? como pausa o como una nueva redirección.
	# una nueva redirección iria a la escena desde inicio
	pass
	


'''

func _on_continuar_pressed():
	get_tree().change_scene_to_file(path)
'''
	
