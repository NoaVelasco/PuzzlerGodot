extends Control

var COLLECTION_ID = "name_game"

var name_player = "Javi"
var level = "2"
var points = "150"


'''
Recupero de GLOBAL?

var name_player =
var level =
var points = 

'''


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_logout_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/authentication.tscn")


func _on_save_game_pressed():
	save_data()
	
func save_data():
	# compruebo si el user está autenticado:
	var auth = Firebase.Auth.auth

	if auth.localId:
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var data: Dictionary = {
			"name_player" : name_player,
			"level": level,
			"points": points
		}
		var task: FirestoreTask = collection.update(auth.localId, data)
			
