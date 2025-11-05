extends Node2D

# preload enemy scenes
const basicEnemyPreload = preload("res://scenes/objects/enemy types/enemy.tscn")
const basicBulletPreload = preload("res://scenes/objects/basic_bullet.tscn")
const fastEnemyPreload = preload("res://scenes/objects/enemy types/fast_enemy.tscn")

var mousePos

# spawn a wave with a certain amount of basic enemies at random positions (off-screen)
var rng = RandomNumberGenerator.new()
func spawnBasicWave(amountOfEnemies):
	for i in amountOfEnemies:
		spawnBasicEnemyAtCoords(rng.randi_range(-50,1200),rng.randi_range(-40,-600))


# spawn a wave of a certain amount of faster enemies
func spawnFastEnemyWave(amountOfEnemies):
	for i in amountOfEnemies:
		spawnFastEnemyAtCoords(rng.randi_range(-50,1200),rng.randi_range(-40,-600))



# runs the frame this script/scene is loaded
func _ready(): 
	# spawn some test enemies
	spawnBasicWave(8)
	spawnFastEnemyWave(3)




# spawn enemy at inputted coordinates
func spawnBasicEnemyAtCoords(x,y):
	var basicEnemy = basicEnemyPreload.instantiate()
	add_child(basicEnemy)
	basicEnemy.global_position = Vector2(x,y)

# spawn faster variant enemy at coords x y
func spawnFastEnemyAtCoords(x,y):
	var fastEnemy = fastEnemyPreload.instantiate()
	add_child(fastEnemy)
	fastEnemy.global_position = Vector2(x,y)



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
