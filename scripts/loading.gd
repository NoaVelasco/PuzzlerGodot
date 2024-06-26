extends Control

# Probar a cambiar el timer

@onready var progress : Array
var scene_load_status : int


# Called when the node enters the scene tree for the first time.
func _ready():
	# cargo el recurso
	ResourceLoader.load_threaded_request(GLOBAL.change_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(GLOBAL.change_scene,progress)
	print($ProgressBar.value)

	$ProgressBar.value = progress[0]*100
	
func _on_progress_bar_value_changed(value):
	
	# prueba para detener la carga de la barra de cargando, no funciona
	if value == 25:
		await get_tree().create_timer(1000).timeout
		
	# Si ha llegado el valor a 100 y ha cargado el recurso con éxito:
	if value == 100 and scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		# call_deferred() permite asegurar la llamada de los valores, de una nueva función y el parámetro.
		get_tree().call_deferred("change_scene_to_packed", ResourceLoader.load_threaded_get(GLOBAL.change_scene))
