extends TileMapLayer

var astar = AStarGrid2D.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()

func setup() -> void:
	astar.cell_size = Vector2i(32,32)
	astar.region = Rect2i(0,0,36,36)
	astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_CHEBYSHEV
	astar.update()
	for i in get_used_cells():
		#prints(i, get_cell_tile_data(i).get_custom_data("solid"))
		if get_cell_tile_data(i).get_custom_data("solid"):
			astar.set_point_solid(i,true)
	var path = astar.get_point_path(Vector2i(1,1),Vector2i(30,10))
	for i in path:
		path[path.find(i)] += Vector2(16,16)
	#print(astar.get_point_path(Vector2i(1,1),Vector2i(30,5)))
	$"../Line2D".points = path
