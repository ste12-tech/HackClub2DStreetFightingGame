extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#@export var spawn_x: float=global_position


func _physics_process(delta: float) -> void:
	# Add the gravity.
	print(global_position)
	if not is_on_floor():
		velocity += get_gravity() * delta
	if global_position.y > 2000:
		queue_free()
		return
	# Handle jump.
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
