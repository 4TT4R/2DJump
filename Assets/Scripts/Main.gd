extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var current_scene
var current_scene_path
var seconds = 0
var minuts = 0
var hours = 0
var next_level = "LvL00"
var time = "--:--:--"
var SFX = 1
var paused = false
var Music = 100
export var is_pc = false
var cam_pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	$click.volume_db = SFX
	current_scene = load("res://Assets/Maps/Main Menu.tscn").instance()
	add_child(current_scene)
func changelevel(level):
	seconds = 0
	minuts = 0
	hours = 0
	remove_child(current_scene)
	current_scene = load("res://Assets/Maps/"+level+".tscn").instance()
	current_scene_path = "res://Assets/Maps/"+level+".tscn"
	add_child(current_scene)

func changelevel2(level, key, colatable):
	seconds = 0
	minuts = 0
	hours = 0
	get_node("Save").save(key, next_level, colatable, time)
	remove_child(current_scene)
	current_scene = load("res://Assets/Maps/"+level+".tscn").instance()
	current_scene_path = "res://Assets/Maps/"+level+".tscn"
	add_child(current_scene)
	if current_scene_path == "res://Assets/Maps/Levels.tscn":
		get_node("Levels/Camera2D").position = cam_pos
func die():
	remove_child(current_scene)
	current_scene = load(current_scene_path).instance()
	add_child(current_scene)
	
func restart():
	remove_child(current_scene)
	current_scene = load(current_scene_path).instance()
	add_child(current_scene)
	seconds = 0
	minuts = 0
	hours = 0
# Called every frame. 'delta' is the seconds time since the previous frame.
func _process(delta):
	if !paused:
		seconds += delta;
		if seconds >= 60:
			seconds -= 60
			minuts += 1
		if minuts >= 60:
			minuts -= 60
			hours +=1
		time = str(hours)+":"+str(minuts)+":" + "%0.2f" % seconds
func saveT():
	get_node("Save").saveT()
	
