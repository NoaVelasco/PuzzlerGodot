extends TileMap

@onready var player = $"../Duck"

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position = Vector2(512, 576)
