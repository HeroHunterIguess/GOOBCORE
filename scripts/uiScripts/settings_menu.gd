extends Node2D

func _on_back_to_game_pressed() -> void:
	get_tree().get_parent().visible = false
