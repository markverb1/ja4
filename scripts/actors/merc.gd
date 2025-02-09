extends Node2D

@export var merc_short_name: String = "Guy"
@onready var wep = $Weapon
var mpos: Vector2 = Vector2.ZERO
var test:int=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	test += 1
	if (test % 2 == 0):
		var rotdeg = int(rad_to_deg(global_position.angle_to_point(mpos)))
		if rotdeg < -90 or rotdeg > 90:
			scale = Vector2(-1,1)
		else:
			scale = Vector2(1,1)
		wep.look_at(mpos)

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		mpos = event.position

	# Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
