extends Node2D

var COLLECTION_ID = "games"



var nivel : String

# Called when the node enters the scene tree for the first time.
func _ready():
	%Player_load.text = "Player " + GLOBAL.name_player.split("@")[0]
	load_data()
	
	
	print("nivel " + nivel)
	
	print(int(nivel))
	

		#%lvl_1.visible = not %lvl_1.visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func check_level(nivel):
	if int(nivel) == 1:
		get_tree().change_scene_to_file("res://ingame/level/Lvl_1.tscn")
	if int(nivel) < 2:
		print("entra en > 2")
		%lvl_2.disabled = true
	if int(nivel) < 3:
		%lvl_3.disabled = true
	
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
		
		if !(document):
			nivel = "1"
		else:
			nivel = document.doc_fields.level
			
		print(nivel)
		# para mostrar los valores:
		'''
		playerLabel.text = "Player: %s" % GLOBAL.name_player	
		level.text = "%s" % num_level
		'''
		'''
		if document && document.doc_fields:
			if document.doc_fields.name_player:
				playerLabel.text = document.doc_fields.name_player
			if document.doc_fields.level:
				level.text = document.doc_fields.level 
		else:
			print(finished_task.error)
		
		'''
		print(nivel)
		check_level(nivel)


func _on_load_pressed():
	load_data()


func _on_lvl_1_pressed():
	get_tree().change_scene_to_file("res://ingame/level/Lvl_1.tscn")


func _on_lvl_2_pressed():
	get_tree().change_scene_to_file("res://ingame/level/Lvl_2.tscn")


func _on_lvl_3_pressed():
	get_tree().change_scene_to_file("res://ingame/level/Lvl_3.tscn")


func _on_logout_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/authentication.tscn")
