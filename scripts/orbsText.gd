extends Label

func _process(_delta):
	self.text = str(Globals.orbs) + " orbs"
	
	
	# harrison made this
	if Globals.orbs > 999999:
		self.text = "poop"
