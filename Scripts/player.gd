extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_move
@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("Idle")
	can_move = true

func _physics_process(delta):
	if can_move:
			# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

	# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("move_left", "move_right")

		# Flip the sprite based on direction
		if direction > 0:
			anim.flip_h = false
		elif direction < 0:
			anim.flip_h = true

		# Play the correct animations based on direction value
		if is_on_floor():
			if direction == 0:
				anim.play("Idle")
			else:
				anim.play("Run")
		else:
			anim.play("Jump")

		# Makes the player move with speed
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	else:
		anim.play("Idle")
