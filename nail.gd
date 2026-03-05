extends Node2D

var dragging = false
var offset = Vector2.ZERO

func _ready():
	$Area2D.input_pickable = true

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + offset


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			dragging = true
			offset = global_position - get_global_mouse_position()
		else:
			dragging = false
