extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Open = preload("res://Assets/Textures/Objects/DoorOpen.png")
var Close = preload("res://Assets/Textures/Objects/DoorUnlocked.png")
export var next_level = "LvL00"
export var level = "LvL00"
onready var sprite = get_node("Sprite")
var open = false
func _ready():
	pass


func _process(delta):
	if open:

		get_parent().get_parent().get_node("door_go").play(0)
		get_parent().get_parent().next_level = next_level
		get_parent().get_parent().changelevel2("Levels", level, get_parent().colected)
			




func _on_door_area_entered(_area):
	sprite.set_texture(Open)
	get_node("door").play(0)
	open = true


func _on_door_area_exited(_area):
	sprite.set_texture(Close)
	get_node("door").play(0)
	open = false
