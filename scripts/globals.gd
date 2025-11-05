extends Node


var score = 0
var playerLocation = Vector2(580,580)


func hitByBasicBullet(EnemyHP):
	EnemyHP -= 1
	return EnemyHP


func reset():
	score = 0
