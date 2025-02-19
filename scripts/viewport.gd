extends Control

@export var messages: RichTextLabel
#@onready var player = $AudioStreamPlayer
@onready var music_emitter: FmodEventEmitter2D = $Music
var event

func play_event(event_name: String, vol: float=1) -> void:
	var emitter: FmodEventEmitter2D = FmodEventEmitter2D.new()
	emitter.event_guid = FmodServer.get_event_guid("event:/" + event_name.trim_prefix("/").trim_suffix("/"))
	emitter.volume = vol
	add_child(emitter)
	emitter.play()
	#await emitter.stopped
	#emitter.queue_free()

func add_message(message: String):
	messages.newline()
	messages.append_text(message)
	play_event("GUI/Notification", 1)
	
#func play_sound(sound: AudioStreamWAV, vol: float = 0):
	#player.stream = sound
	#player.volume_db = vol
	#player.play(0)

func merc_selected():
	$Panel/ShortName.text = mercservice.selected_merc.short_name
	$Panel/LongName.text = mercservice.selected_merc.long_name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.message_added.connect(add_message)
	mercservice.merc_selected.connect(merc_selected)
	global.message_added.emit("Initialized...")
	#emitter.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.text = "FPS: " + str(int(Engine.get_frames_per_second()))


func _show_mercs_pressed() -> void:
	print(global.mercs)
