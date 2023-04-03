extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var HP
var level = "Tutorial"
var pause
var colected
var times
var is_paused = false
var Gold = "00:00:00"
var Silver = "00:00:00"
var Bronze = "00:00:00"

# Called when the node enters the scene tree for the first time.
func _ready():
	Gold = get_parent().gold
	Silver = get_parent().silver
	Bronze = get_parent().bronze
func _process(delta):
	if Input.is_action_just_pressed("esc") && !get_node("Player").dead:
		_on_Pause_pressed()
	get_node("Player/Camera2D/Label").text = str(get_parent().hours)+":"+str(get_parent().minuts)+":" + "%0.2f" % get_parent().seconds
	get_parent().paused = is_paused
	

func _reset():
	get_tree().reload_current_scene()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pause_pressed():
	if !is_paused:
		is_paused = true
		pause = load("res://Assets/Maps/Pause.tscn").instance()
		add_child(pause)
		pause.global_position = get_node("Player").get_node("Camera2D").global_position +get_node("Player").get_node("Camera2D").offset
		pause.z_index=5
	
func times():
	is_paused = true
	times = load("res://Assets/Maps/times.tscn").instance()
	add_child(times)
	times.global_position = get_node("Player").get_node("Camera2D").global_position +get_node("Player").get_node("Camera2D").offset
	times.z_index=5
	
