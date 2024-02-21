extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var moving_collider = $CollisionShape2D

var move_speed: int = 150
var mask_is_centered = true
var collision = false
var motion = Vector2(0,0)

#func _ready():
	#position = Vector2(160, 544)

func _physics_process(_delta):
	#var motion = Vector2()
	#motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	#print(motion.x)
	
	#var motion = Input.get_vector("move_left","move_right", "move_up", "move_down")
	
	if motion:
		if mask_is_centered == true:
			moving_collider.position += motion * 5
			mask_is_centered = false
	else:
		moving_collider.position = animated_sprite.position
		mask_is_centered = true
	
	velocity = motion * 400
	
	update_animation(motion)
	collision = move_and_slide()

	#if collision != false:
		#print(collision)
	#if move_and_slide():
		#moving_collider = motion

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
		
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)

func play_recorded():
	while collision != true:
		motion += Vector2(10, 0)

