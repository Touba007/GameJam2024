extends CharacterBody3D
signal hit

# How fast the player moves in meters per second.
@export var speed = 10
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

@export var jump_impulse = 20
var target_velocity = Vector3.ZERO

var has_touched_portal = 0
var i = 0
var iscrouch = 0

func _physics_process(delta):
	var direction = Vector3.ZERO
	if has_touched_portal == 1: 
		if i == 30 :
			has_touched_portal = 0
			i = 0
		else : 
			i = i + 1
		
	elif Input.is_action_pressed("move_right"):
		direction.z += 0.7*delta
	elif Input.is_action_pressed("move_left"):
		direction.z -= 0.7*delta
	elif is_on_floor() and Input.is_action_pressed("jump") :
		target_velocity.y = jump_impulse
	elif is_on_floor() and Input.is_action_pressed("down") : 
		if iscrouch == 0 : 
			rotate_z(PI/2)
			iscrouch = 1
	elif not Input.is_action_pressed("down") : 
		if iscrouch == 1 : 
			rotate_z(-PI/2)
			iscrouch = 0
	
	

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
	get_tree().change_scene_to_file("Scenes/game_over_page.tscn")


func _on_death_detector_body_entered(_body):
	die()



func _on_area_3d_body_entered(body):
	has_touched_portal = 1
	
