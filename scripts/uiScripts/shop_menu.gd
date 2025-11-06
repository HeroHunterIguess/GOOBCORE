extends Control



func shopInput():
	if Input.is_action_just_pressed("openShop") && get_tree().paused == false:
		get_tree().paused = true
	if Input.is_action_just_pressed("openShop") && get_tree().paused == true:
		get_tree().paused = false



func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.get_parent().visible = false
