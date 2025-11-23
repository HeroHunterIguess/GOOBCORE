extends Node2D


# just the start button so far
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/worlds/main_game_scene.tscn")

# enable/disable ldm
func _on_ldm_button_pressed() -> void:
	if Globals.ldm == false:
		Globals.ldm = true
		$ldmButton.text = "Low detail mode (enabled)"
	else:
		Globals.ldm = false
		$ldmButton.text = "Low detail mode (disabled)"
