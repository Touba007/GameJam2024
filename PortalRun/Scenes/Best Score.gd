extends Label


func _process(delta):
	global.set_best()
	text = "Best Score : %d" %global.bestScore
