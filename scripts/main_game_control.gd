extends Node2D

# preload enemy scenes
const basicEnemyPreload = preload("res://scenes/objects/enemy.tscn")
const basicBulletPreload = preload("res://scenes/objects/basic_bullet.tscn")

var mousePos




# runs the frame this script/scene is loaded
func _ready(): 
	
	# spawn some test enemies
	spawnEnemyAtCoords(100,100)
	spawnEnemyAtCoords(500,500)
	spawnEnemyAtCoords(350,200)




# spawn enemy at inputted coordinates
func spawnEnemyAtCoords(x,y):
	var basicEnemy = basicEnemyPreload.instantiate()
	add_child(basicEnemy)
	basicEnemy.global_position = Vector2(x,y)





# spawn a bullet and make it go towards the mouse
func spawnBullet():
	
	# spawning bullet at player location
	var basicBullet = basicBulletPreload.instantiate()
	add_child(basicBullet)
	basicBullet.global_position = Vector2(580,580)
	
	# get direction and set velocity to go there
	var dir = (get_global_mouse_position() - basicBullet.global_position).normalized()
	basicBullet.velocity = dir * basicBullet.speed




# runs every frame
func _process(_time):
	$Score.text = "Score: " + str(Globals.score)
	
	mousePos = get_viewport().get_mouse_position()
	
	#keybind for abilities
	if Input.is_action_just_pressed("ability1"):
		spawnBullet()
	
	# send to game over if player dies
	if Globals.playerHealth <= 0:
		get_tree().change_scene_to_file("res://scenes/worlds/game_over.tscn")






func _on_player_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		Globals.decreasePlayerHealth(2)
		print(Globals.playerHealth)
