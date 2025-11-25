extends Node2D

@onready var score_label = $ScoreLabel
@onready var wave_label = $waveLabel

# tell player their score

func _ready():
	score_label.text = "Score  " + str(Globals.overallScore) 
	wave_label.text = "Wave  " + str(Globals.currentWave) 
	
	# hide shader if ldm is on
	if Globals.ldm == true:
		$ColorRect.visible = false
		$ColorRect2.visible = false



func _on_button_pressed() -> void:
	Globals.reset()
	get_tree().change_scene_to_file("res://scenes/worlds/menu.tscn")
