extends Node


var score = 0
var playerLocation = Vector2(580,580)
var playerHealth = 20

func decreasePlayerHealth(amount):
	playerHealth -= amount


func hitByBasicBullet(EnemyHP):
	EnemyHP -= 1
	return EnemyHP


func reset():
	score = 0
	playerHealth = 20
