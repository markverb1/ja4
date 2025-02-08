extends Control

@onready var messages = $RichTextLabel

func add_message(message: String):
	messages.newline()
	messages.append_text(message)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.message_added.connect(add_message)
	global.message_added.emit("joe")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.text = "FPS: " + str(int(Engine.get_frames_per_second()))


func _show_mercs_pressed() -> void:
	print(global.mercs)
