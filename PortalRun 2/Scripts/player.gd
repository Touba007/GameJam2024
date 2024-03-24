extends CharacterBody3D
signal hit

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

@export var jump_impulse = 20
var target_velocity = Vector3.ZERO


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.z -= 1
	if is_on_floor() and Input.is_action_pressed("jump") :
		target_velocity.y = jump_impulse
	

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()


# And this function at the bottom.
func die():
	hit.emit()
	queue_free()


func _on_death_detector_body_entered(_body):
	print("HELOOOOO")
	die()

