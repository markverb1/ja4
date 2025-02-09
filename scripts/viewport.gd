extends Control

@onready var messages = $RichTextLabel
@onready var player = $AudioStreamPlayer

func add_message(message: String):
	messages.newline()
	messages.append_text(message)
	play_sound(load("res://assets/audio/notif.wav"),-5)
	
func play_sound(sound: AudioStreamWAV, vol: float = 0):
	player.stream = sound
	player.volume_db = vol
	player.play(0)

func merc_selected():
	$Panel/ShortName.text = global.selected_merc.short_name
	$Panel/LongName.text = global.selected_merc.long_name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.message_added.connect(add_message)
	global.merc_selected.connect(merc_selected)
	global.message_added.emit("Initialized...")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.text = "FPS: " + str(int(Engine.get_frames_per_second()))


func _show_mercs_pressed() -> void:
	print(global.mercs)
