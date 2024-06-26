extends Node2D

@onready var music = $Control/bckgrnd
@onready var player = $Duck
@onready var ui = $UI_movement
@onready var popup = $Level1/Window01
@onready var label = $UI_movement/UI_Flechas
@onready var label_shdw = $UI_movement/UI_Flechas_shdw
@onready var win_snd = $Control/Win_snd
@onready var fail_snd = $Control/Fail_snd

@onready var pause = preload("res://scenes/pause.tscn")
@onready var menu_player = preload("res://scenes/perfil.tscn")
@onready var menu_options = preload("res://scenes/options.tscn")
@onready var win_lose = preload("res://scenes/win.tscn")

var mensaje



var waiting_state: bool = true  # impide añadir nuevos movimientos cuando mueve
var movements: Array = []
var commands = {"⬅️": Vector2(-1, 0),
				"➡️": Vector2(1, 0),
				"⬆️": Vector2(0, -1),
				"⬇️": Vector2(0, 1)}

func _ready():
	GLOBAL.save_data()
	var pause_ins = pause.instantiate()
	var player_menu = menu_player.instantiate()
	var options_menu = menu_options.instantiate()
	var win_lose_canvas = win_lose.instantiate()
	
	add_child(pause_ins)
	add_child(player_menu)
	add_child(options_menu)
	add_child(win_lose_canvas)
	
	mensaje = win_lose_canvas.mensaje

func _process(_delta):
	if waiting_state and not popup.visible:
		if Input.is_action_just_pressed("cadena"):
			duckmoves()
		# Solo caben 10 flechas actualmente. Deberían caber más.
		elif len(movements) < 10:
			if Input.is_action_just_pressed("move_left"):
				movements.append("⬅️")
			elif Input.is_action_just_pressed("move_right"):
				movements.append("➡️")
			elif Input.is_action_just_pressed("move_up"):
				movements.append("⬆️")
			elif Input.is_action_just_pressed("move_down"):
				movements.append("⬇️")
			elif Input.is_action_just_pressed("print"):
				print(movements)
			# Llena el label con las flechas añadidas.
			label.text = "\n".join(movements)
			label_shdw.text = label.text



func duckmoves():
	'''
	Ejecuta cada movimiento de la lista hasta que no quedan movimientos. 
	Pinta las flechas en los labels y "desactiva" las que ya han sido usadas.
	'''
	waiting_state = false
	var new_lbl_txt: String = label.text.right(-3)
	var incr: int = 1
	for move in movements:
		player.playing = commands[move]
		# Esto "desactiva" las flechas verdes y solo se ven las grises.
		label.text = "\n".repeat(incr) + new_lbl_txt
		new_lbl_txt = new_lbl_txt.right(-3)
		incr += 1
		# No ejecuta el siguiente movimiento hasta que no termina el ciclo y choca.
		await player.wall_collision
	# Se vacía la lista de movimientos.
	movements = []
	label_shdw.text = ""
	waiting_state = true  # Solo para modo pruebas. Quitar en release.
	check_win_con()

func check_win_con():
	'''Comprueba si el jugador ha logrado objetivo o ha fallado.'''
	if player.win_con:
		mensaje.text = "!!Enhorabuena!!"
		mensaje.show()
		win_snd.play()
		GLOBAL.win = true		
		await win_snd.finished
		get_tree().change_scene_to_file(GLOBAL.go_to_lvl(2))
	else:
		fail_snd.play()
		GLOBAL.win = false
		mensaje.text = "!Vuelve a intentarlo!"
		mensaje.show()
		await fail_snd.finished
		get_tree().change_scene_to_file(GLOBAL.go_to_lvl(1))


func _on_button_pressed():
	if waiting_state:
		duckmoves()


func _on_bckgrnd_finished():
	music.play()
