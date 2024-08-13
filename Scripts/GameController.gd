extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	$ShotPut.launch(Vector2(400, -50000))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Arena.speed = $ShotPut.m_groundSpeed
	$Arena2.speed = $ShotPut.m_groundSpeed
	$Arena3.speed = $ShotPut.m_groundSpeed
	$StartingZone.speed = $ShotPut.m_groundSpeed
	pass
