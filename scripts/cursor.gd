extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x = snapped(get_global_mouse_position().x-16,32)
	position.y = snapped(get_global_mouse_position().y-16,32)


func _on_area_entered(area: Area2D) -> void:
	print(area.get_parent().name)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and len($Area2D.get_overlapping_areas())>0:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				
				var clicked = $Area2D.get_overlapping_areas()[0].get_parent()
				if "merc_short_name" in clicked:
					global.selected_merc = global.find_merc(clicked.merc_short_name)
