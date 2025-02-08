extends Node2D

@onready var wep = $Weapon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var rotdeg = int(rad_to_deg(global_position.angle_to_point(get_global_mouse_position())))
	if rotdeg < -90 or rotdeg > 90:
		scale = Vector2(-1,1)
	else:
		scale = Vector2(1,1)
	wep.look_at(get_global_mouse_position())
