extends Control


func _on_play_button_pressed():
	global.score = 0
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
	
func _on_volume_button_pressed():
	pass # Replace with function body.
	
	
func _on_quit_button_pressed():
	get_tree().quit()
