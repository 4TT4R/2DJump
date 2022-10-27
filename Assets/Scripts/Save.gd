extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


class_name Save
const FILE_NAME = "user://game-data.data"
var unlocked_levels = {"LvL00":true}
var levels_colatable = {"LvL00":false, "LvL01":false, "LvL02":false}
var levels_time = {"LvL00":"--:--:--"}
const DEFAULT_TIME = "--:--:--"
var game_data
# Called when the node enters the scene tree for the first time.
func _ready():
	loadT()
func save(key, next_level, colectable, time):
	unlocked_levels[next_level] = true
	if colectable:
		levels_colatable[key] = colectable
	if !levels_time.has(key):
		levels_time[key] = time
	if levels_time[key] != DEFAULT_TIME:
		print(key)
		var last_time = levels_time[key].split(":")
		var curent_time = time.split(":")
		print(last_time, " last", "\n", curent_time," current")

		if (float(last_time[0])*3600 + float(last_time[1])*60 + float(last_time[2]) >= float(curent_time[0])*3600 + float(curent_time[1]) * 60 + float(curent_time[2])):
			
			levels_time[key] = time
		else:
			levels_time[key] = levels_time[key]
	else:
		levels_time[key] = time
	saveT()
func reset():
	game_data = {
		"unlocked_levels" : unlocked_levels,
		"levels_colatable" : levels_colatable,
		"levels_time" : levels_time
	}


func saveT():
	game_data = {
		"unlocked_levels" : unlocked_levels,
		"levels_colatable" : levels_colatable,
		"levels_time" : levels_time
	}
	var file = File.new()
	file.open_encrypted_with_pass(FILE_NAME, File.WRITE,"szUMtGcAhp9Z8eY!!dd*5yAsqiGthQGamKQyk*Cq*sEAaFr&!Uvgg@Hp!DWxg^62co8mJ@ikbChos393gZnRfz@n4m6c7Qi@T%V5cVbk3SwSVydhyizDh3ye%!DtctB4")
	file.store_var(game_data)
	file.close()

func loadT():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open_encrypted_with_pass(FILE_NAME, File.READ, "szUMtGcAhp9Z8eY!!dd*5yAsqiGthQGamKQyk*Cq*sEAaFr&!Uvgg@Hp!DWxg^62co8mJ@ikbChos393gZnRfz@n4m6c7Qi@T%V5cVbk3SwSVydhyizDh3ye%!DtctB4")
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			game_data = data
			unlocked_levels = game_data["unlocked_levels"]
			levels_colatable = game_data["levels_colatable"]
			levels_time = game_data["levels_time"]
		else:
			printerr("Corrupted data!")
	else:

		printerr("No saved data!")
