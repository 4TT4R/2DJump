extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




export var Unlock = false
export var Level_Name = "Level Name"
export var Level = "00"
export var Gold = "00:00:00"
export var Silver = "00:00:00"
export var Bronze = "00:00:00"

var medail = 0
var time = "--:--:--"
var def_time = "--:--:--"
var colactable = false
var gold = Color("ffd700")
var silver = Color("c0c0c0")
var bronze = Color("cd7f32")
var locked = Color("212121")
# Called when the node enters the scene tree for the first time.
func _ready():
	medail = 0
	
	var key = "LvL"+Level
	if get_parent().get_parent().get_parent().get_node("Save").unlocked_levels.has(key):
		Unlock = get_parent().get_parent().get_parent().get_node("Save").unlocked_levels[key]

	elif key=="LvL00" || key=="LvL0":
		Unlock =true
	else:
		get_parent().get_parent().get_parent().get_node("Save").unlocked_levels[key] = Unlock
	
	if get_parent().get_parent().get_parent().get_node("Save").levels_colatable.has(key):
		colactable = get_parent().get_parent().get_parent().get_node("Save").levels_colatable[key]
	else:
		get_parent().get_parent().get_parent().get_node("Save").levels_colatable[key] = colactable
	
	if get_parent().get_parent().get_parent().get_node("Save").levels_time.has(key):
		time = get_parent().get_parent().get_parent().get_node("Save").levels_time[key]
	else:
		get_parent().get_parent().get_parent().get_node("Save").levels_time[key] = time
	get_node("Button").text = Level
	if Unlock:
		get_node("Locked").visible = false
	else:
		get_node("Button").disabled = true
	
	get_node("Medails/Bronze").modulate = locked
	get_node("Medails/Silver").modulate = locked
	get_node("Medails/Gold").modulate = locked
	
	if time != def_time:
		var time_arr = time.split(":")
		
		var Gold_arr = Gold.split(":")
		var Silver_arr = Silver.split(":")
		var Bronze_arr = Bronze.split(":")
		
		if (float(Gold_arr[0])*3600 + float(Gold_arr[1])*60 + float(Gold_arr[2]) >= float(time_arr[0])*3600 + float(time_arr[1]) * 60 + float(time_arr[2])):
			
			medail = 3
		elif (float(Silver_arr[0])*3600 + float(Silver_arr[1])*60 + float(Silver_arr[2]) >= float(time_arr[0])*3600 + float(time_arr[1]) * 60 + float(time_arr[2])):
			medail = 2
		elif (float(Bronze_arr[0])*3600 + float(Bronze_arr[1])*60 + float(Bronze_arr[2]) >= float(time_arr[0])*3600 + float(time_arr[1]) * 60 + float(time_arr[2])):
			medail = 1
		
	if medail >= 1:
		get_node("Medails/Bronze").modulate = bronze
	if medail >= 2:
		get_node("Medails/Silver").modulate = silver
	if medail >= 3:
		get_node("Medails/Gold").modulate = gold
	if colactable:
		get_node("Collect").modulate = Color("ffffff")
	else:
		get_node("Collect").modulate = locked
	get_node("Label").text = time
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if Unlock:
		get_parent().get_parent().get_parent().gold = Gold
		get_parent().get_parent().get_parent().silver = Silver
		get_parent().get_parent().get_parent().bronze = Bronze
		get_parent().get_parent().get_parent().cam_pos = get_parent().get_parent().get_node("Camera2D").position
		get_parent().get_parent().get_parent().get_node("click").play(0)
		get_parent().get_parent().get_parent().changelevel(Level_Name)
		

