extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D

var move_speed: int = 150
var mask_is_centered = true

#func _ready():
	#position = Vector2(160, 544)

func _physics_process(_delta):
	#var motion = Vector2()
	#motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var motion = Input.get_vector("move_left","move_right", "move_up", "move_down")

	#if motion:
		#if mask_is_centered == true:
			#moving_collider.position += motion * 20
			#mask_is_centered = false
	#else:
		#moving_collider.position = animated_sprite.position
		#mask_is_centered = true

	velocity = motion * move_speed
	
	update_animation(motion)
	move_and_slide()
	#if move_and_slide():
		#moving_collider.position = animated_sprite.position
		#await get_tree().create_timer(0.5).timeout

func update_animation(motion: Vector2):
	var animation = "idle"
	if move_and_slide():
		animation = "hit"
		#animated_sprite.animation
	if motion.x > 0:
		animated_sprite.flip_h = false
		animation = "roll_y"
	elif motion.x < 0:
		animated_sprite.flip_h = true
		animation = "roll_y"
	elif motion.y < 0:
		animation = "roll_x"
	elif motion.y > 0:
		animation = "roll_x"
#
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)

func duckmoves(delta, index_movs, len_movs, movements, commands):
	while index_movs < len_movs:
		var move: String = movements[index_movs]
		print(move_and_collide(delta))
		while not move_and_collide(delta):
			velocity = commands[move] * move_speed
			move_and_slide()
			#position += commands[move]
		index_movs += 1
		await get_tree().create_timer(0.5).timeout



