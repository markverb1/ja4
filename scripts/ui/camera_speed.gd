extends Control

var cam: Camera2D
@onready var slider = $Slider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cam = $"../../SubViewportContainer/SubViewport".get_camera_2d()
	slider.value = cam.camera_speed

func _on_slider_value_changed(value: float) -> void:
	cam.camera_speed = value
	$Value.text = str("%10.2f" % value)
