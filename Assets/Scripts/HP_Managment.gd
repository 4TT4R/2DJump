extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var HP = 100

var parent
var once = true
var dead = false
func _ready():
	parent = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if HP<=0:
		
		
		if not once:
			parent.set_physics_process(false)
			parent.sprite.play("Dead")
			once = true
			get_node("Timer").start(3)

		if get_node("Timer").time_left<=1&& dead:
			get_node("Timer").stop()
		
			get_parent().get_parent()._reset()
		
func Die():
	once = false
	dead = true















