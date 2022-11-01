extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var def_zoom = Vector2(5,5)
var screensize = OS.get_real_window_size() 
var size = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	
	size = Vector2(1024*def_zoom.x, 600* def_zoom.y)
	zoom.x = size.x/screensize.x
	zoom.y = size.y/screensize.y
	current = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screensize = OS.get_real_window_size()
	zoom.x = size.x/screensize.x
	zoom.y = size.y/screensize.y

