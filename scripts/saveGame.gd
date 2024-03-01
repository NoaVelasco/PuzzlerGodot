extends Node2D

var COLLECTION_ID = "games"

var name_player : String
var num_level : String


@onready var popup = $Window
@onready var save_button = $Window/ColorRect/Control/Panel/Save

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().paused = true
	save_button.grab_focus()
	popup.hide()
	
	
func _process(delta):
	if Input.is_action_just_pressed("yes"):
		
		# Pausa debe dejar mover el menú
		get_tree().paused = true
		save_data()
		# save_game()
		
	if Input.is_action_just_pressed("No"):
		# Pausa debe dejar mover el menú
		get_tree().paused = false
		popup.hide()
		

func _on_window_close_requested():
	popup.hide()
	

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
	popup.hide()
