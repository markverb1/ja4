extends Node

var rng = RandomNumberGenerator.new()
var viewport = preload("res://scripts/viewport.gd")

@warning_ignore("unused_signal")
signal message_added(message)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(create_merc("Guy", "Guyase Verb").long_name)
	#print(find_merc("Guy").long_name)
	pass
