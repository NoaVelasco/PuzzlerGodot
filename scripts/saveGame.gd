extends Node2D

@onready var popup = $Window
@onready var save_button = $Window/ColorRect/Control/Panel/Save

# Called when the node enters the scene tree for the first time.
func _ready():
	save_button.grab_focus()
	popup.show()


func _on_window_close_requested():
	popup.hide()


func _on_back_pressed():
	popup.hide()


func _on_save_pressed():
	pass
