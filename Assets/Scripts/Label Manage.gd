extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var Move = get_node("Move")
onready var Jump = get_node("Jump")
onready var F = get_node("F")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Move_area_entered(_area):
	Move.visible = true

func _on_Move_area_exited(_area):
	Move.visible = false


func _on_Jump_area_entered(_area):
	Jump.visible = true


func _on_Jump_area_exited(_area):
	Jump.visible = false


func _on_F_area_entered(_area):
	F.visible = true


func _on_Area2D3_area_exited(_area):
	F.visible = false
