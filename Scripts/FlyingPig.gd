extends Sprite2D


func Roll():
	print("rolling")
	self.visible = false
	var rng = RandomNumberGenerator.new()
	var result = rng.randi_range(1, 10)
	if(result == 1):
		self.visible = true
		$Oink.play()
