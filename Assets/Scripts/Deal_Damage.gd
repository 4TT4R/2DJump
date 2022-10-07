extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var Damage = 6;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Saw_area_entered(area):
	get_parent().Hit(Damage)
	print("hit")
	


