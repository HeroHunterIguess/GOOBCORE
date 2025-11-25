extends Node2D

func _ready():
	# when spawned play sound and animation
	$explodeSound.play()
	$explosion.play()
