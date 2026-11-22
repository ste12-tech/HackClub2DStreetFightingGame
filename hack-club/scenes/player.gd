extends CharacterBody2D
#working for 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var lives = 4 

func _physics_process(delta: float) -> void:

	# Kill player if they fall below Y 2000
	
	if global_position.y > 2000:
		var lives = lives - 1
		if lives == 4:
			position.x= -1541.0
			position.y= -891.5666
		if lives == 3:
			$"../HBoxContainer/HeartPixelArt254x256A".hide()
			position.x= -1541.0
			position.y= -891.5666
		elif lives == 2:
			$"../HBoxContainer/HeartPixelArt254x256B".hide()
			position.x= -1541.0
			position.y= -891.5666
		elif lives == 1:
			$"../HBoxContainer/HeartPixelArt254x256c".hide()
			position.x= -1541.0
			position.y= -891.5666
		elif lives == 0:
			$"../HBoxContainer/HeartPixelArt254x256d".hide()
		return
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("attack") :
		2nd .position
	

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
