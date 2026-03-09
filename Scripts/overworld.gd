extends Node2D

# (2-d) If RMB is not clicked, toggle overworld off (REF: main.gd)
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if !event.pressed:
			get_tree().change_scene_to_file(GameManager.previous_scene)
