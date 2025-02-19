extends Node2D

@export var merc_short_name: String = "Guy"
var me: Mercenary
@onready var wep = $Weapon
var mpos: Vector2 = Vector2.ZERO
var test:int=0
var selected_merc:
	get:
		return selected_merc
	set(val):
		selected_merc = val
		merc_selected.emit()

signal merc_selected(merc)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	me = mercservice.find_merc(merc_short_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mpos = get_global_mouse_position()
	test += 1
	if (test % 2 == 0):
		var rotdeg = int(rad_to_deg(global_position.angle_to_point(mpos)))
		if rotdeg < -90 or rotdeg > 90:
			scale = Vector2(-1,1)
		else:
			scale = Vector2(1,1)
		wep.look_at(mpos)
		$Weapon/Hand.rotation = 0
