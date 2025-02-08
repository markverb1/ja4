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
