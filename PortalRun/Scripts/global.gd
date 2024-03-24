extends Node

var bspeed = 10
var bestScore = 0
var score = 0


func set_best() : 
	if score > bestScore : 
		bestScore = score
