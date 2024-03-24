extends Node

@export var bloc_scene: PackedScene


func _on_timer_timeout():
	# Create a new instance of the Mob scene.
	var bloc = bloc_scene.instantiate()


	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var bloc_spawn_location = get_node("Path3D/PathFollow3D")
	# And give it a random offset.
	bloc_spawn_location.progress_ratio = randf() 
	var my_array = [0, 0, 1, 2.2]
	var offsetx = my_array[randi() % my_array.size()]
	
	# Get the position of the spawn location
	var spawn_position = bloc_spawn_location.global_transform.origin
	
	# Initialize the mob with position and offset
	bloc.initialize(spawn_position, bloc_spawn_location.progress_ratio, offsetx)

	# Spawn the mob by adding it to the Main scene.
	add_child(bloc)


func _on_player_hit():
	$Timer.stop()
