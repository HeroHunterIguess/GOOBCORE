extends Control



#func _ready():
	#$PanelContainer/VBoxContainer/bbDamage.text = "upgrade basic bullet damage ("+str(Globals.basicBulletDamageCost)+" orbs)"
	#$PanelContainer/VBoxContainer/bbSpeed.text = "upgrade basic bullet speed ("+str(Globals.basicBulletSpeedCost)+" orbs)"



func _process(_time):
	if Input.is_action_pressed("openShop") && self.get_parent().visible == false:
		get_tree().paused = false
		self.get_parent().visible = false



# check if you open shop and like youre paused or smth yk
func shopInput():
	if Input.is_action_just_pressed("openShop") && get_tree().paused == false:
		get_tree().paused = true
	if Input.is_action_just_pressed("openShop") && get_tree().paused == true:
		get_tree().paused = false




# resume game if you press resume ofc
func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.get_parent().visible = false



# check for buttons pressed & upgrade things
