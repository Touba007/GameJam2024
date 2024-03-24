extends Label

func _process(delta):
	global.score += 25 * delta
	text = "Score : %d" % global.score
