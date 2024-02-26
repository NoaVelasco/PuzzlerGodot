extends Control

# Deberia ser por ejemplo: "games"
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
	# load_data()
	# Aqui recupero los valores para mostrar en la pantalla actual del nivel
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
		
		# Valores que voy a guardar
		var data: Dictionary = {
			"name_player" : name_player,
			"level": level,
			"points": points
		}
		var task: FirestoreTask = collection.update(auth.localid, data)

'''

'''			
func load_data():
		# compruebo si el user está autenticado:
	var auth = Firebase.Auth.auth
	
	if auth.localid != "":
		print("esta autenticado")
		print(GLOBAL.name_player)

		var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
		# Ahora la tarea/task es recuperar los datos:
		var task: FirestoreTask = collection.get_doc(auth.localid)
		# Y obtengo el documento:
		var finished_task: FirestoreTask = await task.task_finished
		var document = finished_task.document
		print(document)
		# para mostrar los valores:
		'''
		playerLabel.text = "Player: %s" % GLOBAL.name_player	
		level.text = "%s" % num_level
		'''
		
		if document && document.doc_fields:
			if document.doc_fields.name_player:
				playerLabel.text = document.doc_fields.name_player
			if document.doc_fields.level:
				level.text = document.doc_fields.level 
		else:
			print(finished_task.error)
		
