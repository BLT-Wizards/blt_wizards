extends TileMapLayer
signal tile_clicked(cell: Vector2i)
@export var ground_layer: TileMapLayer
@export var top_layer: TileMapLayer
var hovered_cell: Vector2i = Vector2i(-1, -1)
var is_pressed := false
func _process(_delta: float) -> void:
	var current_cell: Vector2i = local_to_map(get_local_mouse_position())
	if current_cell != hovered_cell:
		if hovered_cell != Vector2i(-1, -1):
			top_layer.erase_cell(hovered_cell)
		hovered_cell = current_cell
		update_hover_tile(hovered_cell)
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		is_pressed = event.pressed
		if is_pressed:
			top_layer.erase_cell(hovered_cell)  # holding: hide it
			if ground_layer and ground_layer.is_tile_buildable(hovered_cell):
				tile_clicked.emit(hovered_cell)
		else:
			update_hover_tile(hovered_cell)     # let go: bring it back
func update_hover_tile(cell: Vector2i) -> void:
	if is_pressed:
		return  # don't draw anything while the button is held
	if ground_layer and ground_layer.is_tile_buildable(cell):
		top_layer.set_cell(cell, 1, Vector2i(0, 0))
