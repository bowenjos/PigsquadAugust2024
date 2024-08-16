extends Sprite2D

var direction: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	shuffle()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shuffle():
	self.texture = load("res://Art/Arrow.png")
	
	var rng = RandomNumberGenerator.new()
	direction = rng.randi_range(0, 3)
	
	if(direction == 0):
		self.rotation = 0
	elif(direction == 1):
		self.rotation = PI
	elif(direction == 2):
		self.rotation = -PI/2
	elif(direction == 3):
		self.rotation = PI/2
		
func correct():
	self.texture = load("res://Art/ArrowGreen.png")
	
func failed():
	self.texture = load("res://Art/ArrowRed.png")
