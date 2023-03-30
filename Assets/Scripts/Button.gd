extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Exit_pressed():
	get_parent().get_parent().get_parent().saveT()
	get_tree().quit()


func _on_Continue_pressed():
	play_click()
	get_tree().paused = false
	get_parent().get_parent().is_paused = false
	get_parent().queue_free()


func _on_Main_Menu_pressed():
	play_click()
	get_parent().get_parent().get_parent().changelevel("Main Menu")



func _on_Levels_pressed():
	play_click()
	get_parent().get_parent().get_parent().get_node("Save").loadT()
	get_parent().get_parent().get_parent().changelevel("Levels")
	

func _on_Credits_pressed():
	play_click()
	get_parent().get_parent().get_parent().changelevel("Credits")
	
func play_click():
	get_parent().get_parent().get_parent().get_node("click").play(0)

func play_click2():
	get_parent().get_parent().get_parent().get_parent().get_node("click").play(0)

func _on_Settings_pressed():
	play_click()
	
	get_parent().get_parent().get_parent().changelevel("Settings")


func _on_Back_pressed():
	play_click()
	get_parent().get_parent().get_parent().changelevel("Main Menu")


func _on_next_pressed():
	play_click2()
	get_parent().get_parent().get_parent().get_node("Camera2D").position.x = get_parent().get_parent().get_parent().get_node("Camera2D").position.x + 2048 



func _on_prev_pressed():
	play_click2()
	get_parent().get_parent().get_parent().get_node("Camera2D").position.x = get_parent().get_parent().get_parent().get_node("Camera2D").position.x - 2048 


func _on_Back2_pressed():
	play_click2()
	get_parent().get_parent().get_parent().get_parent().changelevel("Main Menu")


func _on_New_Game_pressed():
	play_click()
	get_parent().get_parent().get_parent().get_node("Save").reset()
	get_parent().get_parent().get_parent().changelevel("Levels")



func _on_next():
	get_parent().get_parent().get_node("Door").next() # Replace with function body.
