extends Node2D


# Called when the node enters the scene tree for the first time.



func _on_area_2d_body_entered(body):
	self.visible = false
	var rng = RandomNumberGenerator.new()
	var result = rng.randi_range(1, 2)
	if(result == 1):
		self.visible = true
		$AudioStreamPlayer2D.play()
