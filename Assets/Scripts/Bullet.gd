extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export(String, "UP", "DOWN", "RIGHT", "LEFT") var direction
var velocity
var trigered = false
var counter = 0
export var triger_number = 1
export var SPEED = 5000
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite").visible = false
	if direction == "UP":
		rotation_degrees = 270
		velocity = Vector2(0, -SPEED)
	elif direction == "DOWN":
		rotation_degrees = 90
		velocity = Vector2(0, SPEED)
	elif direction == "RIGHT":
		rotation_degrees = 0
		velocity = Vector2(SPEED, 0)
	elif direction == "LEFT":
		velocity = Vector2(-SPEED, 0)
		rotation_degrees = 180
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if trigered:
		position += velocity*delta
		get_node("AnimatedSprite").visible = true
		get_node("AnimatedSprite").play("Bullet")

func _on_Triger_area_entered(area):
	if area.is_in_group("Player"):
		counter += 1
		if counter >= triger_number:
			trigered = true
	


func _on_Bullet_body_entered(body):
	
	queue_free()
	print("Bullet Destroy , Bullet.gd line 43")
