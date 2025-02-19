extends Camera2D

var camvel = Vector2.ZERO
@export_range(0,10,0.25) var camera_speed: float = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += camvel
	camvel = Vector2.ZERO
	if Input.is_action_pressed("camera_down"): camvel += Vector2.DOWN*delta;
	if Input.is_action_pressed("camera_left"): camvel += Vector2.LEFT*delta;
	if Input.is_action_pressed("camera_right"): camvel += Vector2.RIGHT*delta;
	if Input.is_action_pressed("camera_up"): camvel += Vector2.UP*delta;
	camvel = camvel.normalized() * camera_speed
	
