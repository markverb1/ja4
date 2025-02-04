extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = snapped(clamp(rotation_degrees,-90,90),5)
