extends Node2D

func _ready():
	# when spawned play sound and animation
	$explodeSound.play()
	$explosion.play()
	
	# hide animation after that finishes then wait for sfx to finish before destroying object
	await get_tree().create_timer(0.32).timeout
	$explosion.visible = false
	await get_tree().create_timer(0.4).timeout
	queue_free()
