extends CharacterBody2D

@export var speed = 200
@export var jump_force = -400
var gravity = 900

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump input
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	# Move left/right
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Flip sprite based on direction
	if direction < 0:
		sprite.flip_h = false
	elif direction > 0:
		sprite.flip_h = true

	move_and_slide()

	update_animation()


func update_animation():
	if not is_on_floor():
		if sprite.animation != "jump":
			sprite.play("jump")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")
