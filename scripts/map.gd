extends Control

var astar = AStarGrid2D.new()
var astardiag = AStarGrid2D.new()
@export var current_map: Node2D
@onready var tilemap: TileMapLayer = current_map.get_node("Layer1")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not current_map:
		return
	setup(astar)
	setup(astardiag,AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func setup(pathfinder: AStarGrid2D, diagonal_mode: AStarGrid2D.DiagonalMode = AStarGrid2D.DIAGONAL_MODE_NEVER) -> void:
	pathfinder.cell_size = Vector2i(32, 32)
	pathfinder.region = Rect2i(-400,-400,800,800)
	pathfinder.diagonal_mode = diagonal_mode
	pathfinder.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	pathfinder.update()
	for i in tilemap.get_used_cells():
		#prints(i, get_cell_tile_data(i).get_custom_data("solid"))
		if tilemap.get_cell_tile_data(i).get_custom_data("solid"):
			pathfinder.set_point_solid(i, true)
	#print(astar.get_point_path(Vector2i(1,1),Vector2i(30,5)))

func pathfind_to_tile(pathfinder:AStarGrid2D, from: Vector2i, to: Vector2i) -> PackedVector2Array:
	if not from or not to:
		return []
	var path = pathfinder.get_point_path(from, to)
	for i in path:
		path[path.find(i)] += Vector2(16, 16)
		tilemap.set_cell(i/32,path.find(i),Vector2i(0,0))
	pass
	return path
	

func _on_cursor_moved(to: Vector2i) -> void:
	$Line2D.points = pathfind_to_tile(astardiag,$Merc.position/32,to)
