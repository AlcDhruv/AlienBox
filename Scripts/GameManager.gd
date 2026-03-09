extends Node

# (1-a) For handling the number of collectible MILKS packs
var milk_count = 3

# (1-b) Global function that can be called in any other code
func collect_milk():
	milk_count -= 1
	
	if milk_count == 0:
		get_tree().paused = true
		print("Game Over")
