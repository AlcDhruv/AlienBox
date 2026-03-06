extends CharacterBody2D

@export var speed = 200
@export var jump_force = -400
var gravity = 900
var jump_count = 0

@onready var sprite = $AnimatedSprite2D
@onready var aura: Node2D = $Aura

func _physics_process(delta):
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("toggle_aura"):
		aura.visible = !aura.visible
	# Jump input
# Reset when touching the ground
	if is_on_floor():
		jump_count = 0

	# Jump logic
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		velocity.y = jump_force
		jump_count += 1

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
