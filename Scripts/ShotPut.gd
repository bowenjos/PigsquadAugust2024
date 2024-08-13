extends RigidBody2D

var m_groundSpeed: float = 0
var distanceTraveled: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distanceTraveled += m_groundSpeed * delta


func launch(i_force: Vector2):
	self.apply_force(Vector2(0, i_force.y))
	m_groundSpeed = i_force.x
