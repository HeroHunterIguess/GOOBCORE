extends Node2D

var health = 1
var damage = 1


var explodeScene = preload("res://scenes/objects/deathexplosion.tscn")



# take an amount of damage for the projectiles to call
func takeDamage(amount):
	health -= amount


# take knockback from being hit by bigger attacks
func takeKB(amount):
	position.y -= amount


# enemy will travel towards the player location
func moveToPlayer(delta):
	var speed = 105
	var to_player = Globals.playerLocation - self.global_position
	var distance = to_player.length()
	
	if distance > 25:
		if distance > 0:
			var direction = to_player.normalized()
			position += direction * speed * delta
	else:
		queue_free()



# each frame move towards player and check if dead
func _process(delta):
	
	if health <= 0:
		Globals.overallScore += 1
		#spawn and play death animation
		var explosion = explodeScene.instantiate()
		get_tree().get_current_scene().add_child(explosion)
		explosion.global_position = self.global_position
		# let death animation play out
		queue_free()
	else:
		moveToPlayer(delta)
