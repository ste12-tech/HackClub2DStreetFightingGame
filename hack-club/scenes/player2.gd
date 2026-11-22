extends CharacterBody2D
#not working
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var livess = 4
func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	
		
	
	
	# Kill player if they fall below Y 2000
	if global_position.y > 2000:
		var lives = livess - 1
		if livess == 4:
			position.x= 905.3242
			position.y= -229.0005
		if livess == 3:
			$"../HBoxContainer1/HeartPixelArt254x256A".hide()
			position.x= 905.3242
			position.y= -229.0005
		elif livess == 2:
			print("triggered")
			$"../HBoxContainer1/HeartPixelArt254x256B".hide()
			position.x= 905.3242
			position.y= -229.0005
		elif livess == 1:
			$"../HBoxContainer1/HeartPixelArt254x256C".hide()
			position.x= 905.3242
			position.y= -229.0005
		elif lives == 0:
			$"../HBoxContainer1/HeartPixelArt254x256D".hide()
		return
	# Handle jump.
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_jump2") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left2", "ui_right2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
 
	move_and_slide()
