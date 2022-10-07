extends KinematicBody2D


export var WALK = 70000
export var RUN = 90000
export var JUMP_POWER = -2500
export var GRAVITY = 5800
export var BOUNDS_MAX = Vector2(10000, 10000)
export var BOUNDS_MIN = Vector2.ZERO
var counter = 0
var once = true
var dead = false
var speed = RUN
var up = false
var left = false
var right = false

var can_jump =true
var take_damage = false

var direction = Vector2.ZERO

onready var sprite = get_node("Sprite")
func _ready():
	sprite = get_node("Sprite")

func _process(_delta):

	if dead:
		position-=Vector2(10,5)
		if not once:
			set_physics_process(false)
			sprite.visible = false
			get_node("Area2D").monitorable = false
			add_child(load("res://Assets/Particles2D.tscn").instance())
			get_node("Sfx/Die").play(0)
			once = true
			get_node("Timer").start(3)

		if get_node("Timer").time_left<=1&& dead:
			get_node("Timer").stop()

			get_parent().get_parent().die()






func move(delta):

	if right || Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		direction.x = speed*delta

	if left || Input.is_action_pressed("ui_left"):
		direction.x = -speed*delta
		sprite.flip_h = true

	if up && can_jump || Input.is_action_pressed("ui_up") && can_jump:
		direction.y = JUMP_POWER
		get_node("Sfx/jump").play(0)
		sprite.play("Jump")
		can_jump = false

	direction.y+= GRAVITY*delta

func _physics_process(delta):

	if position.y > BOUNDS_MAX.y:
		once = false
		dead = true
		print(position.y)
		print(BOUNDS_MAX.y)
		print("die fall")
#	reset x direction on every start cyklus couase when don't player continue move infinitly 
	direction.x = 0
#	function to control which key is pressed and set move adequary to it
	move(delta)
	if direction.x != 0 && !get_node("Sfx/walk").playing && can_jump:
		get_node("Sfx/walk").play()
	elif direction.x == 0 || !can_jump || dead:
		get_node("Sfx/walk").stop()
	direction = move_and_slide(direction, Vector2.UP)
#	control animations
	animation_controller()
	if direction.y> 500:
		can_jump = false
	if is_on_floor():
		can_jump = true

func animation_controller():
	if direction.x != 0 && direction.y == 0:
		sprite.play("Run")
	elif direction == Vector2.ZERO:
		sprite.play("Idle")
	elif can_jump && direction.y >500:
		get_node("Sprite").set_animation("Jump")
		get_node("Sprite").set_frame(9)
func _on_Area2D_area_entered(area):
	if area.is_in_group("Collect"):
		get_node("Sfx/pickup").play(0)
	if area.is_in_group("Kill") && !dead:
		
		once = false
		dead = true
		


func _on_Left_button_down():
	left = true


func _on_Right_button_down():
	right = true


func _on_Jump_button_down():
	up = true


func _on_Left_button_up():
	left = false


func _on_Right_button_up():
	right = false


func _on_Jump_button_up():
	up = false


func _on_Pause_button_down():
	pass # Replace with function body.


func _on_Left_pressed():
	left = true


func _on_Left_released():
	left = false


func _on_Right_pressed():
	right = true


func _on_Right_released():
	right = false


func _on_Jump_pressed():
	up = true


func _on_Jump_released():
	up = false
