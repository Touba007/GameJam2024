extends Node3D

@onready var level = $"../"
var speed = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	if position.x < -5 : 
		level.spawnModule(position.x + level.amount * level.offset)
		queue_free()
@export var mob_scene: PackedScene


func _on_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()


	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("Path3D/PathFollow3D")
	# And give it a random offset.
	mob_spawn_location.progress_ratio = randf() 
	var my_array = [0,3,6]
	var offsetx = my_array[randi() % my_array.size()]
	
	# Get the position of the spawn location
	var spawn_position = mob_spawn_location.global_transform.origin
	
	# Initialize the mob with position and offset
	mob.initialize(spawn_position, mob_spawn_location.progress_ratio, offsetx)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
