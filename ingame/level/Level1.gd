extends TileMap

@onready var duck = $"../Duck"

# Called when the node enters the scene tree for the first time.
func _ready():
	duck.position = Vector2(512, 576)
	#pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
