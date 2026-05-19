extends Node2D

@onready var vision_area = $Area2D

var seen_time := 0.0
var required_time := 3.0


func _process(delta):

	var player_visible = false

	for body in vision_area.get_overlapping_bodies():
		if body.is_in_group("player"):
			player_visible = true


	if player_visible:
		seen_time += delta
		print("Seen time:", seen_time)

		if seen_time >= required_time:
			game_over()

	else:
		seen_time = 0


func game_over():
	print("GAME OVER")
	get_tree().paused = true
