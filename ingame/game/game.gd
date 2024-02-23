extends Node2D

@onready var player = $Duck
@onready var timer = $Duck/Timer_moves

var movements: Array = []
var commands = {"left": Vector2(-1, 0),
				"right": Vector2(1, 0),
				"up": Vector2(0, -1),
				"down": Vector2(0, 1)}
#var index_movs = 0
#var len_movs = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("move_left"):
		movements.append("left")
	elif Input.is_action_just_pressed("move_right"):
		movements.append("right")
	elif Input.is_action_just_pressed("move_up"):
		movements.append("up")
	elif Input.is_action_just_pressed("move_down"):
		movements.append("down")
	elif Input.is_action_just_pressed("print"):
		print(movements)
	elif Input.is_action_just_pressed("cadena"):
		#len_movs = len(movements)
		duckmoves()


 #Cuando el temporizador termina, ejecuta cada movimiento de la lista y se reinicia
 #hasta que no quedan movimientos. Entonces se resetea.
func duckmoves():
	for move in movements:
		player.playing = commands[move]
	#while index_movs < len_movs:
		#var move: String = movements[index_movs]
		#if player.collision != true:
			#player.play_recorded()
			#print("yay!")
			#$Duck.position += commands[move]
			#print(player.position.x)
		#index_movs += 1
		await get_tree().create_timer(2.5).timeout
		#await timer.start()

	movements = []
