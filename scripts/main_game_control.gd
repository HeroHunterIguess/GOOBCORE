extends Node2D


# preload enemy scenes
const basicEnemyPreload = preload("res://scenes/objects/enemy types/enemy.tscn")
const basicBulletPreload = preload("res://scenes/objects/basic_bullet.tscn")
const fastEnemyPreload = preload("res://scenes/objects/enemy types/fast_enemy.tscn")

var mousePos


# create a wave of different types of enemies based on the wave number
func advancedWaveControl(waveNum):
	# create a basic wave for the first one
	if waveNum == 1:
		spawnBasicWave(waveNum + 2)
	# slightly more advanced waves until wave 5
	if waveNum > 1 && waveNum < 5:
		spawnBasicWave(waveNum + 2)
		spawnFastEnemyWave(round(waveNum / 2))
	# full standardized waves starting at wave 5
	if waveNum >= 5:
		spawnBasicWave(waveNum + 2)
		spawnFastEnemyWave(round(waveNum / 2))
		spawnTankEnemyWave(round(waveNum / 4))




# spawn a wave with a certain amount of basic enemies at random positions (off-screen)
var rng = RandomNumberGenerator.new()
func spawnBasicWave(amountOfEnemies):
	for i in amountOfEnemies:
		spawnBasicEnemyAtCoords(rng.randi_range(-50,1200),rng.randi_range(-40,-600))

# spawn a wave of a certain amount of faster enemies
func spawnFastEnemyWave(amountOfEnemies):
	for i in amountOfEnemies:
		spawnFastEnemyAtCoords(rng.randi_range(-50,1200),rng.randi_range(-70,-1000))

func spawnTankEnemyWave(amountOfEnemies):
	pass



# runs the frame this script/scene is loaded
func _ready(): 
	# spawn some test enemies
	advancedWaveControl(Globals.currentWave)





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
	$Orbs.text = "Orbs: " + str(Globals.orbs)
	$waveNum.text = "Wave: " + str(Globals.currentWave)
	
	mousePos = get_viewport().get_mouse_position()
	
	#keybind for abilities
	if Input.is_action_just_pressed("ability1"):
		spawnBullet()
	
	# send to game over if player dies
	if Globals.playerHealth <= 0:
		get_tree().change_scene_to_file("res://scenes/worlds/game_over.tscn")
	
	if get_tree().get_nodes_in_group("Enemy").size() == 0:
		print("wave over")
		Globals.currentWave += 1
		advancedWaveControl(Globals.currentWave)







func _on_player_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		Globals.decreasePlayerHealth(2)
		print(Globals.playerHealth)
