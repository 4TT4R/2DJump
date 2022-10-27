extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if (get_parent().get_parent().get_parent().get_parent().is_pc):
		visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Left_pressed():
	get_parent().get_parent()._on_Left_pressed()


func _on_Left_released():
	get_parent().get_parent()._on_Left_released()


func _on_Right_pressed():
	get_parent().get_parent()._on_Right_pressed()


func _on_Right_released():
	get_parent().get_parent()._on_Right_released()


func _on_Jump_pressed():
	get_parent().get_parent()._on_Jump_pressed()


func _on_Jump_released():
	get_parent().get_parent()._on_Jump_released()


func _on_Pause_pressed():
	get_parent().get_parent().get_parent()._on_Pause_pressed()
