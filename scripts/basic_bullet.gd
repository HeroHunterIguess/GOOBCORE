extends Node2D

var velocity = Vector2.ZERO
var speed = 500
var damage = 1

# go to position based on velocity
func _process(delta: float):
	if velocity != Vector2.ZERO:
		global_position += velocity * delta


func _on_bullet_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.get_parent().takeDamage(damage)
		queue_free()
