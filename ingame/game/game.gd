extends Node2D

@onready var player = $Duck


var movements: Array = []
var commands = {"left": Vector2(-1, 0),
				"right": Vector2(1, 0),
				"up": Vector2(0, -1),
				"down": Vector2(0, 1)}


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
		duckmoves()


 # Cuando el temporizador termina, ejecuta cada movimiento de la lista 
 # hasta que no quedan movimientos. Entonces se resetea.
func duckmoves():
	for move in movements:
		player.playing = commands[move]
		await player.wall_collision

	movements = []
