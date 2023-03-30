extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gold = Color("ffd700")
var silver = Color("c0c0c0")
var bronze = Color("cd7f32")
var locked = Color("212121")
var medail = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label2").text = get_parent().Gold
	get_node("Label3").text = get_parent().Silver
	get_node("Label4").text = get_parent().Bronze
	get_node("Medails/Bronze").modulate = locked
	get_node("Medails/Silver").modulate = locked
	get_node("Medails/Gold").modulate = locked
	if !get_parent().colected:
		get_node("Collect").modulate = locked
	var time_arr = get_parent().get_parent().time.split(":")
	var Gold_arr = get_parent().Gold.split(":")
	var Silver_arr = get_parent().Silver.split(":")
	var Bronze_arr = get_parent().Bronze.split(":")
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
