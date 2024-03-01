extends Node

# para guardar la escena a nivel global
var current_level = 1
var curr_lvl_path = "res://ingame/level/Lvl_" + str(current_level) + ".tscn"
#var change_scene = "res://ingame/level/level_1.tscn"

# Para guardar nomre y  puntuación del personaje a nivel global
var name_player : String
var score : int

var pause = false

var win : bool

'''
Sobre save_data
'''
var COLLECTION_ID = "games"
var num_level : String



# Movimiento del jugador
var axis : Vector2

func go_to_lvl(new_level):
	current_level = new_level
	curr_lvl_path = "res://ingame/level/Lvl_" + str(current_level) + ".tscn"
	return curr_lvl_path
	
# función para retornar la dirección pulsada:
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
'''

# Para guardar la puntuación del personaje a nivel global
var score : int

# Movimiento del jugador
var axis : Vector2


# función para retornar la dirección pulsada:
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
	# normalized permite que se muevan con la misma velocidad en cualquier dirección


'''


func save_data():
	# compruebo si el user está autenticado:
	var auth = Firebase.Auth.auth
	
	if auth.localid != "":
		
		name_player = GLOBAL.name_player.split("@")[0]
		num_level = str(GLOBAL.current_level)
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		
		# Valores que voy a guardar
		var data: Dictionary = {
			"name_player" : name_player,
			"level": num_level
		}
		var task: FirestoreTask = collection.update(auth.localid, data)
		
	get_tree().paused = false

