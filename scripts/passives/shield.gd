extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.get_parent().takeDamage(99999)
		queue_free()
		Globals.hasShield = false
