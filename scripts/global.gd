extends Node

var rng = RandomNumberGenerator.new()
var mercs: Array = []
var merc = preload("res://scripts/mercenary.gd")
var viewport = preload("res://scripts/viewport.gd")

signal message_added(message)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func create_merc(short_name,long_name,):
	mercs.insert(merc.max_id,merc.new(short_name,long_name))
	return mercs[len(mercs)-1]
	#print(rng.randi()

func find_merc(merc_name:String, short:bool=true):
	for i in mercs:
		if (merc_name == i.short_name and short) or (merc_name == i.long_name and not short):
			return i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(create_merc("Guy", "Guyase Verb").long_name)
	#print(find_merc("Guy").long_name)
	#create_merc("Guy", "Guyase Verb")
	wait(1)
	
	global.message_added.emit("fuck")
	if create_merc("Guy", "Guyase Verb").long_name == find_merc("Guy").long_name:
		global.message_added.emit("merc insertion sanity check passed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void
	#create_merc()
