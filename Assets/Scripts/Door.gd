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
var locked = true
var next
func _ready():
	sprite.set_texture(Close)


func _process(delta):
	if open:
		get_parent().times()
		get_parent().get_node("Player").sprite.play("Idle")

func next():
	get_parent().get_parent().get_node("door_go").play(0)
	get_parent().get_parent().next_level = next_level
	get_parent().get_parent().changelevel2("Levels", level, get_parent().colected)
func unlock():
	pass
#	sprite.set_texture(Open)
#	locked = false

func _on_door_area_entered(_area):
		sprite.set_texture(Open)
		open = true
		get_node("door").play(0)

func _on_door_area_exited(_area):
	pass
