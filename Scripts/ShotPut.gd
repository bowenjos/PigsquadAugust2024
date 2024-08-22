extends RigidBody2D

var startingXPos: float = 0

var m_groundSpeed: float = 0
var distanceTraveled: float = 0

signal stop_motion

# Called when the node enters the scene tree for the first time.
func _ready():
	startingXPos = self.position.x
	freeze = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distanceTraveled += m_groundSpeed * delta

func _physics_process(delta):
	self.position.x = startingXPos
	self.linear_velocity.x = 0
	
	if(self.position.y >= 400):
		m_groundSpeed = 0
		

func stop():
	self.linear_velocity.y = 0
	m_groundSpeed = 0
	stop_motion.emit()

func launch(i_force: Vector2):
	freeze = false
	#self.apply_force(Vector2(0, i_force.y))
	self.linear_velocity.y = i_force.y
	m_groundSpeed = i_force.x


func try_launch(i_power: int, i_angle: float):
	var vec: Vector2 = Vector2(cos(i_angle), sin(i_angle))
	vec *= i_power*100
	launch(vec)


func _on_player_try_launch(i_power, i_angle):
	var vec: Vector2 = Vector2(cos(i_angle), sin(i_angle))
	vec.y *= i_power*100
	vec.x *= i_power*100
	launch(vec)


func _on_body_entered(body):
	stop()
	pass # Replace with function body.
