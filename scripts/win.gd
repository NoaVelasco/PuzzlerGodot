extends CanvasLayer

var mensaje 

func _ready():
	mensaje = get_node("win_lose")
	%win_lose.hide()
	%win_lose.text = ""
