extends Node


# random things
var orbs = 10
var overallScore = 0
var currentWave = 1
var rerollCost = 5

var ldm = false


var playerLocation = Vector2(640,688)
var playerHealth = 30
var noWave = false



# vars for passive abilities
var hasShield = false
var ShieldBaseCost = 25
var spawningShield = false




# vars for push wall attack
var wideAttackBaseCost = 25
var wideAttackCooldown = 200
var wideAttackDamage = 0.45
var wideAttackSpeed = 190
var wideAttackLevel = 1


# vars for basic bullet
var basicBulletCooldown = 16
var basicBulletDamage = 1.75
var basicBulletSpeed = 585
var basicBulletLevel = 1


# vars for frag grenade
var fragGrenadeBaseCost = 20
var fragGrenadeCooldown = 100
var fragGrenadeDamage = 12
var fragGrenadeSpeed = 350
var fragGrenadeAmount = 8
var fragDamage = 1.5
var fragGrenadeLevel = 1


# vars for bullet burst attack
var burstAmount = 10
var burstDamage = 8
var burstCooldown = 180
var burstLevel = 1
var burstBaseCost = 35


# list of all ability names:
# Push wall
# Basic bullet
# Lazer             (not done)
# Burst attack
# Frag grenade      
# Giant bullet      (not done)
# empty slot


# abilities selected
var ability1 = "Basic bullet" 
var ability2 = "empty slot"







# decrease player health by certain amount
func decreasePlayerHealth(amount):
	playerHealth -= amount


func hitByBasicBullet(EnemyHP):
	EnemyHP -= 1
	return EnemyHP




# resetting all essential variables back to defaults 
func reset():
	orbs = 10
	rerollCost = 5
	overallScore = 0
	playerHealth = 30
	currentWave = 1
	noWave = false
	ability1 = "Basic bullet" 
	ability2 = "empty slot"
	
	# reset all ability stats

	# vars for push wall attack
	wideAttackBaseCost = 20
	wideAttackCooldown = 200
	wideAttackDamage = 0.45
	wideAttackSpeed = 190
	wideAttackLevel = 1


	# vars for basic bullet
	basicBulletCooldown = 18
	basicBulletDamage = 1.75
	basicBulletSpeed = 585
	basicBulletLevel = 1


	# vars for frag grenade
	fragGrenadeBaseCost = 18
	fragGrenadeCooldown = 100
	fragGrenadeDamage = 12
	fragGrenadeSpeed = 350
	fragGrenadeAmount = 8
	fragDamage = 1.5
	fragGrenadeLevel = 1


	# vars for bullet burst attack
	burstAmount = 10
	burstDamage = 8
	burstCooldown = 180
	burstLevel = 1
	burstBaseCost = 35
	
	
	
	# vars for passive abilities
	hasShield = false
	ShieldBaseCost = 25
	spawningShield = false
