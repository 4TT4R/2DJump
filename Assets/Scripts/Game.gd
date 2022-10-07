extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var HP
var level = "Tutorial"
var pause
var colected
var is_paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
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
