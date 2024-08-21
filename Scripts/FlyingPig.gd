extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	var rng = RandomNumberGenerator.new()
	var result = rng.randi_range(1, 10)
	if(result == 1):
		self.visible = true
		$Oink.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
