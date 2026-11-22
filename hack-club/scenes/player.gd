extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var lives = 4 


func _physics_process(delta: float) -> void:

	# Kill player if they fall below Y 2000
	if global_position.y > 2000:
		var lives = lives - 1
		
			
		position.x= -1541.0
		position.y= -891.5666
		return

	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
