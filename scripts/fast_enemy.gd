extends Node2D

var health = 2.5
var damage = 1

var explodeScene = preload("res://scenes/objects/deathexplosion.tscn")


# take an amount of damage for the projectiles to call
func takeDamage(amount):
	health -= amount
	# play hurt animation
	$AnimatedSprite2D.visible = false
	$hurtanim.visible = true
	await get_tree().create_timer(0.15).timeout
	$AnimatedSprite2D.visible = true
	$hurtanim.visible = false
	
	# play hurt sfx
	$deathSound.play()


# take knockback from being hit by bigger attacks
func takeKB(amount):
	position.y -= amount





# enemy will travel towards the player location
func moveToPlayer(delta):
	var speed = 210
	var to_player = Globals.playerLocation - position
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
		Globals.orbs += 1
		Globals.overallScore += 1
		#spawn and play death animation
		var explosion = explodeScene.instantiate()
		get_tree().get_current_scene().add_child(explosion)
		explosion.global_position = self.position
		# hide sprites
		#await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.visible=false
		$hurtanim.visible=false
		# let death animation play out
		queue_free()
	else:
		moveToPlayer(delta)
