extends Control


var COLLECTION_ID = "games"

var name_player : String
var num_level : String = "4"

@onready var playerLabel = $Panel/HBoxContainer2/NamePlayer
@onready var level = $Panel/HBoxContainer/Level

'''
Recuperar el level

'''


# Called when the node enters the scene tree for the first time.
func _ready():
	# load_data()
	# Aqui recupero los valores para mostrar en la pantalla actual del nivel

	playerLabel.text = "Player: %s" % GLOBAL.name_player.split("@")[0]	
	level.text = "%s" % num_level
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_logout_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/authentication.tscn")


