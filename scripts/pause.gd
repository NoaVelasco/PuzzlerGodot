extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("pausa"):
		# Pausa debe dejar mover el menú
		print("estoy pausando ")
		get_tree().paused = not get_tree().paused
		
		$Label.visible = not $Label.visible
		
		
