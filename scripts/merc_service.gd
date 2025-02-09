extends Node

signal merc_selected

var mercs: Array = []
var merc = preload("res://scripts/mercenary.gd")
var selected_merc:
	get:
		return selected_merc
	set(val):
		selected_merc = val
		self.merc_selected.emit()

func find_merc(merc_name:String, short:bool=true) -> Mercenary:
	for i in mercs:
		if (merc_name == i.short_name and short) or (merc_name == i.long_name and not short):
			return i
	return mercs[0]

func create_merc(short_name:String,long_name:String):
	mercs.insert(merc.max_id,merc.new(short_name,long_name))
	return mercs[len(mercs)-1]
	#print(rng.randi()

func create_merc_from_dict(dict: Dictionary) -> void:
	var created_merc: Mercenary = create_merc(dict["short_name"],dict["long_name"])
	var keys = dict.keys()
	for i in keys:
		created_merc.set(i,dict[i])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_merc("Bug", "SEEING THIS IS A BUG!!!")
	for i in DirAccess.get_files_at("res://data/mercs/"):
		create_merc_from_dict(JSON.parse_string(FileAccess.get_file_as_string("res://data/mercs/"+i)))
	create_merc("Guy", "Guyase Verb")
	#create_merc_from_dict({short_name="joe",long_name="joe mama",dexterity=1})
