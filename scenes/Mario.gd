extends CharacterBody2D
'''
Mov del icono, agregado a escena
'''
@export var speed : float


# @onready var anim = AnimatedSprite2D

func _process(_delta):
	motion_ctrl()
	print(position.x)
	print(position.y)
	
func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * speed
	velocity.y = GLOBAL.get_axis().y * -speed
	

	# if velocity.x != 0:
	#	 print(velocity.x)
		
		# anim.flip_h = false
		
		# $AnimatedSprite2D.animation = "Run"
		# $AnimatedSprite2D.flip_v = false
		# $AnimatedSprite2D.flip_h = velocity.x < 0
		
	move_and_slide()
	
	
func start(pos):
	print(pos)
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
