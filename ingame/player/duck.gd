extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var move_speed: int = 250
var push_speed = 125


func _ready():
	position = Vector2(160, 544)

func _physics_process(_delta):
	#var motion = Vector2()
	#motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var motion = Input.get_vector("move_left","move_right", "move_up", "move_down")
	#print(motion.x)
	velocity = motion * 400
	
	update_animation(motion)
	move_and_slide()

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



