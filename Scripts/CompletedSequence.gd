extends Sprite2D

@onready var HAMMER = load("res://Art/Hammer.png")
@onready var SCREWDRIVER = load("res://Art/Screwdriver.png")
@onready var WRENCH = load("res://Art/Wrench.png")

@onready var HammerSFX = load("res://Sounds/hammer.wav")
@onready var ScrewdriverSFX = load("res://Sounds/drill.wav")
@onready var WrenchSFX = load("res://Sounds/ratchet.wav")

@onready var Audio = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func DisplayGraphic():
	var rng = RandomNumberGenerator.new()
	var result = rng.randi_range(0, 2)
	
	match result:
		0:
			self.texture = HAMMER
			Audio.stream = HammerSFX
		1:
			self.texture = SCREWDRIVER
			Audio.stream = ScrewdriverSFX
		2:
			self.texture = WRENCH
			Audio.stream = WrenchSFX
	
	self.visible = true
	self.modulate = Color(1, 1, 1, 1)
	Audio.play()
	for i in range(1, 10):
		self.modulate = Color(1, 1, 1, float(1/float(i)))
		await $Timer.timeout
	self.modulate = Color(1, 1, 1, 1)
	self.visible = false
