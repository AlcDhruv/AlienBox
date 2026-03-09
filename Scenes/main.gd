extends Node2D

# (2-a) For handling Overworld toggle. Below is the imported scene itself
@onready var overworld = $Overworld

func _ready():
	overworld.visible = false
# (2-b) setting visibility of the overworld off at the beggining

# (2-c) if RMB is pressed, it'll toggle the overworl, else put it off
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			overworld.visible = true
		else:
			overworld.visible = false
