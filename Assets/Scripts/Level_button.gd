extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




export var Unlock = false
export var next_Level = "Level Name"
export var Level = "00"
var medail = 0
var time = "--:--:--"
var colactable = false
var gold = Color("ffd700")
var silver = Color("c0c0c0")
var bronze = Color("cd7f32")
var locked = Color("212121")
# Called when the node enters the scene tree for the first time.
func _ready():
	var key = "LvL"+Level
	if get_parent().get_parent().get_node("Save").unlocked_levels.has(key):
		Unlock = get_parent().get_parent().get_node("Save").unlocked_levels[key]
	else:
		get_parent().get_parent().get_node("Save").unlocked_levels[key] = Unlock
	
	if get_parent().get_parent().get_node("Save").levels_colatable.has(key):
		colactable = get_parent().get_parent().get_node("Save").levels_colatable[key]
	else:
		get_parent().get_parent().get_node("Save").levels_colatable[key] = colactable
	
	if get_parent().get_parent().get_node("Save").levels_time.has(key):
		time = get_parent().get_parent().get_node("Save").levels_time[key]
	else:
		get_parent().get_parent().get_node("Save").levels_time[key] = time
	get_node("Button").text = Level
	if Unlock:
		get_node("Locked").visible = false
	else:
		get_node("Button").disabled = true
	if medail == 0:
		get_node("Medails/Bronze").modulate = locked
		get_node("Medails/Silver").modulate = locked
		get_node("Medails/Gold").modulate = locked
	if medail == 1:
		get_node("Medails/Bronze").modulate = bronze
	if medail == 2:
		get_node("Medails/Silver").modulate = silver
	if medail == 3:
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
		get_parent().get_parent().get_node("click").play(0)
		get_parent().get_parent().changelevel(next_Level)


