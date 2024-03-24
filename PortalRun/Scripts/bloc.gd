extends CharacterBody3D

var speed = 30

func _physics_process(delta):
	position.x -= speed * delta

	move_and_slide()

# This function will be called from the Main scene.
func initialize(position, offsetz, offsety):
	var A = Vector3(position.x, 0, position.z - offsetz)
	translate(A)
	var B = Vector3(0, offsety, 0)
	translate(B)

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
