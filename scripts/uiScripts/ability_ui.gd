extends Node2D

func _process(_delta):
	# show ability names
	$ability1/ability1Name.text = Globals.ability1
	
	
	# this space is bc smth is bugged that for some reason offsets the text
	$ability2/ability2Name.text = "  " + Globals.ability2
	
	
	
	##### show other info about abilities #####
	
	# ability 1 info
	if Globals.ability1 == "Basic bullet":
		# if the ability is basic bullet
		$ability1/ability1Damage.text = str(Globals.basicBulletDamage) + " DMG"
		$ability1/ability1Cooldown.text = str(int(round(Globals.basicBulletCooldown))) + " COOLDOWN"
	elif Globals.ability1 == "Push wall":
		# if the ability is push wall/wide attack
		$ability1/ability1Damage.text = str(Globals.wideAttackDamage) + " DMG"
		$ability1/ability1Cooldown.text = str(int(round(Globals.wideAttackCooldown))) + " COOLDOWN"
	elif Globals.ability1 == "Frag grenade":
		# if the ability is the frag grenade
		$ability1/ability1Damage.text = str(Globals.fragGrenadeDamage) + " DMG"
		$ability1/ability1Cooldown.text = str(int(round(Globals.fragGrenadeCooldown))) + " COOLDOWN"
	elif Globals.ability1 == "Burst attack":
		# if the ability is the burst attack
		$ability1/ability1Damage.text = str(Globals.burstDamage) + " DMG"
		$ability1/ability1Cooldown.text = str(int(round(Globals.burstCooldown))) + " COOLDOWN"
	elif Globals.ability1 == "Piercer":
		# if the ability is the piercing bullet
		$ability1/ability1Damage.text = str(Globals.piercerDamage) + " DMG"
		$ability1/ability1Cooldown.text = str(int(round(Globals.piercerCooldown))) + " COOLDOWN"
	
	
	
	# ability 2 info
	if Globals.ability2 == "Basic bullet":
		# if the ability is basic bullet
		$ability2/ability2Damage.text = str(Globals.basicBulletDamage) + " DMG"
		$ability2/ability2Cooldown.text = str(int(round(Globals.basicBulletCooldown))) + " COOLDOWN"
	elif Globals.ability2 == "Push wall":
		# if the ability is push wall/wide attack
		$ability2/ability2Damage.text = str(Globals.wideAttackDamage) + " DMG"
		$ability2/ability2Cooldown.text = str(int(round(Globals.wideAttackCooldown))) + " COOLDOWN"
	elif Globals.ability2 == "Frag grenade":
		# if the ability is the frag grenade
		$ability2/ability2Damage.text = str(Globals.fragGrenadeDamage) + " DMG"
		$ability2/ability2Cooldown.text = str(int(round(Globals.fragGrenadeCooldown))) + " COOLDOWN"
	elif Globals.ability2 == "Burst attack":
		# if the ability is the burst attack
		$ability2/ability2Damage.text = str(Globals.burstDamage) + " DMG"
		$ability2/ability2Cooldown.text = str(int(round(Globals.burstCooldown))) + " COOLDOWN"
	elif Globals.ability2 == "Piercer":
		# if the ability is the piercing bullet
		$ability2/ability2Damage.text = str(Globals.piercerDamage) + " DMG"
		$ability2/ability2Cooldown.text = str(int(round(Globals.piercerCooldown))) + " COOLDOWN"
	
