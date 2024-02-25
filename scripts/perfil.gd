extends Control

var COLLECTION_ID = "name_game"

var name_player : String
var num_level : String = "4"
var points = "150"

@onready var playerLabel = $Panel/HBoxContainer2/NamePlayer
@onready var level = $Panel/HBoxContainer/Level




'''
Recupero de GLOBAL?

var name_player =
var level =
var points = 

'''


# Called when the node enters the scene tree for the first time.
func _ready():

	playerLabel.text = "Player: %s" % GLOBAL.name_player	
	level.text = "%s" % num_level
	


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
	
	if auth.localid != "":
		print("esta autenticado")
		print(GLOBAL.name_player)
		# print(auth.email)
		name_player = GLOBAL.name_player
		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		var data: Dictionary = {
			"name_player" : name_player,
			"level": level,
			"points": points
		}
		var task: FirestoreTask = collection.update(auth.localid, data)

			
