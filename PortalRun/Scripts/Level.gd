extends Node3D


@export var modules : Array[PackedScene] = []
var amount = 20
var rng = RandomNumberGenerator.new()
var offset = 5



# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amount : 
		spawnModule(n * offset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func spawnModule(n) : 
	rng.randomize()
	var num = randi_range(0, modules.size() - 1)
	var instance = modules[num].instantiate()
	instance.position.x = n
	add_child(instance)
