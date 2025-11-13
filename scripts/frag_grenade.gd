extends Node2D

var velocity = Vector2.ZERO
var speed = Globals.basicBulletSpeed
var damage = Globals.basicBulletDamage



func spawnFrags(amount):
	print("spawning " + amount + " frags")



# go to position based on velocity
func _process(delta: float):
	if velocity != Vector2.ZERO:
		global_position += velocity * delta
	
	if self.position.x > 2000 or self.position.x < -1000:
		queue_free()
	if self.position.y > 2000 or self.position.y < -1000:
		queue_free()



func _on_frag_grenade_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		area.get_parent().takeDamage(damage)
		area.get_parent().takeKB(5)
		spawnFrags(10)
		queue_free()
