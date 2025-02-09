extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().title = "Merc Editor"


func _on_button_pressed() -> void:
	var children = $Panel2/stat.get_children()
	var working: Dictionary = {}
	var filepath: String = $LineEdit.text
	working["long_name"] = $Panel/LineEdit.text
	working["short_name"] = $Panel/LineEdit2.text
	for i in children:
		if i is SpinBox:
			working[i.name] = i.value
	print(working)
	filepath = filepath.trim_suffix("/")
	print(filepath+"/"+$Panel/LineEdit2.text+".json")
	var file = FileAccess.open(filepath+"/"+$Panel/LineEdit2.text+".json", FileAccess.WRITE)
	file.store_string(JSON.stringify(working))

func _on_button_2_pressed() -> void:
	var children = $Panel2/stat.get_children()
	var working: Dictionary = {}
	working["long_name"] = $Panel/LineEdit.text
	working["short_name"] = $Panel/LineEdit2.text
	for i in children:
		if i is SpinBox:
			working[i.name] = i.value
	$TextEdit.text = JSON.stringify(working)
