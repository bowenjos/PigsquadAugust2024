extends GPUParticles2D

var newAmount = 10
var newLifetime = 0.05


func Fire():
	self.amount = newAmount
	self.lifetime = newLifetime
	self.emitting = true
	self.one_shot = true
	$AudioStreamPlayer2D.play()
