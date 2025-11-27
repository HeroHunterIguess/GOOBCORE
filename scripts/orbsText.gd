extends Label

func _process(_delta):
	self.text = str(Globals.orbs) + " orbs"
	
	
	# my nephnew told me to add this lmao
	if Globals.orbs == 250:
		self.text = "poop"
