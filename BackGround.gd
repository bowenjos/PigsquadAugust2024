extends Sprite2D

var speed: float = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed*delta
	if(position.x < -640):
		position.x += 1280
	pass
