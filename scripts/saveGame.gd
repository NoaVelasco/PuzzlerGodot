extends Node2D

'''
Es aqui donde tengo que aplicar la lógica de save player
'''

# Deberia ser por ejemplo: "games"
var COLLECTION_ID = "games"

var name_player : String
var num_level : String = "4"
var points = "150"


@onready var popup = $Window
@onready var save_button = $Window/ColorRect/Control/Panel/Save

# Called when the node enters the scene tree for the first time.
func _ready():
	save_button.grab_focus()
	popup.show()


func _on_window_close_requested():
	popup.hide()


func _on_back_pressed():
	popup.hide()
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_save_pressed():
	save_data()
	

func save_data():
	# compruebo si el user está autenticado:
	var auth = Firebase.Auth.auth
	
	if auth.localid != "":
		print("esta autenticado")
		print(GLOBAL.name_player)
		# print(auth.email)
		name_player = GLOBAL.name_player
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		
		# Valores que voy a guardar
		var data: Dictionary = {
			"name_player" : name_player,
			"level": num_level,
			"points": points
		}
		var task: FirestoreTask = collection.update(auth.localid, data)
