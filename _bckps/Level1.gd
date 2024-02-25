extends TileMap

@onready var player = $"../Duck"


# Called when the node enters the scene tree for the first time.
func _ready():
	player.position = Vector2(512, 576)
	#pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass



func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.coin_snd.play()
		await body.coin_snd.finished
		get_tree().change_scene_to_file("res://ingame/level/level_3.tscn")
