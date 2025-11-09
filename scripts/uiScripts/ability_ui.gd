extends Node2D

func _process(_delta):
	# show ability names
	$ability1/ability1Name.text = Globals.ability1
	$ability2/ability2Name.text = Globals.ability2
	$ability3/ability3Name.text = Globals.ability3
	
	
	
	##### show other info about abilities #####
	
	# ability 1 info
	if Globals.ability1 == "Basic bullet":
		$ability1/ability1Damage.text = str(Globals.basicBulletDamage)
		$ability1/ability1Cooldown.text = str(round(Globals.basicBulletCooldown))
	elif Globals.ability1 == "Push wall":
		$ability1/ability1Damage.text = str(Globals.wideAttackDamage)
		$ability1/ability1Cooldown.text = str(round(Globals.wideAttackCooldown))
	
	
	
	# ability 2 info
	if Globals.ability2 == "Basic bullet":
		$ability2/ability2Damage.text = str(Globals.basicBulletDamage)
		$ability2/ability2Cooldown.text = str(round(Globals.basicBulletCooldown))
	elif Globals.ability2 == "Push wall":
		$ability2/ability2Damage.text = str(Globals.wideAttackDamage)
		$ability2/ability2Cooldown.text = str(round(Globals.wideAttackCooldown))
	
	
	
	# ability 3 info
	if Globals.ability3 == "Basic bullet":
		$ability3/ability2Damage.text = str(Globals.basicBulletDamage)
		$ability2/ability2Cooldown.text = str(round(Globals.basicBulletCooldown))
	elif Globals.ability3 == "Push wall":
		$ability3/ability2Damage.text = str(Globals.wideAttackDamage)
		$ability3/ability2Cooldown.text = str(round(Globals.wideAttackCooldown))
	
