extends Area2D

func _on_area_entered(area):
	var nail = area.get_parent()
	if nail.is_in_group("nail"):
		nail.can_be_moved = true


func _on_area_exited(area):
	var nail = area.get_parent()
	if nail.is_in_group("nail"):
		nail.can_be_moved = false
