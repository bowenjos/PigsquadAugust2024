extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.emitting = true
	self.one_shot = true
	$AudioStreamPlayer2D.play()
