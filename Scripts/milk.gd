extends Area2D

# (3-a) For milk annimation, floating effect 		
var base_y
var float_speed = 3.0
var float_height = 4.0

func _ready():
	base_y = position.y

# (3-b) To move the milk up and down continuously
func _process(delta):
	position.y = base_y + sin(Time.get_ticks_msec() * 0.003 * float_speed) * float_height

# (1-c) If character body enters the milk, destroy the milk (REF: GameManager.gd)
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		GameManager.collect_milk() # Calling func in GameManager.gd
		queue_free() # Same as Destroy
