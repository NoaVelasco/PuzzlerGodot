extends Button

#@export var path = "res://scenes/escena3DInicial.tscn"

# Si quiero una imagen que muestre una carga
# @export var path = "res://scenes/loading.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# grab_focus()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	get_tree().quit()

