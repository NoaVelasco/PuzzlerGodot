extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D

var move_speed: int = 400
var mask_is_centered = true
var collision = false
var motion = Vector2.ZERO
var playing = Vector2.ZERO

#func _ready():
	#position = Vector2(512, 576)

func _physics_process(_delta):
	# MOVIMIENTOS POR INPUT
	#motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	# o TOTAL:
	#motion = Input.get_vector("move_left","move_right", "move_up", "move_down")
	
	# ----MOV UNTIL COLLIDE-------- 
	if playing:
		motion = playing
		if mask_is_centered == true:
			moving_collider.position += motion * 5
			mask_is_centered = false
	if collision:
		motion = Vector2.ZERO
		playing = Vector2.ZERO
		moving_collider.position = animated_sprite.position
		mask_is_centered = true
		$Timer_moves.start()

	velocity = motion * move_speed
	collision = move_and_slide()
	update_animation(motion)
	# ------------
	


func update_animation(direction: Vector2):
	var animation = "idle"
	if collision:
		#await animated_sprite.play("hit")
		animation = "hit"
		#animated_sprite.animation
	elif direction.x > 0:
		animated_sprite.flip_h = false
		animation = "roll_y"
	elif direction.x < 0:
		animated_sprite.flip_h = true
		animation = "roll_y"
	elif direction.y < 0:
		animation = "roll_x"
	elif direction.y > 0:
		animation = "roll_x"
		
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)

func play_recorded():
	if collision == true:
		#playing = true
		motion = Vector2(0, 0)
		#if mask_is_centered == true:
			#moving_collider.position += motion * 5
			#mask_is_centered = false
	else:
		#print(collision)
		#playing = false
		motion = Vector2(10,0)
		#moving_collider.position = animated_sprite.position
		#mask_is_centered = true
		#play = false



func _on_timer_moves_timeout():
	#animated_sprite.play("hit")
	print("timer out")


func _on_area_2d_body_entered(_body):
	get_tree().change_scene_to_file("res://ingame/level/level_3.tscn")
