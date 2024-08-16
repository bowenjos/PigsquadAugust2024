extends Node

var index: int = 0
var power: int = 0

@onready var arrows = [$InputArrow, $InputArrow2, $InputArrow3, $InputArrow4]

var throwing: bool = false

var armRef: Sprite2D
var rotationSwitch: int = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	armRef = $ShotBotArm
	#armRef.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!throwing):
		if(Input.is_action_just_pressed("UpInput")):
			CheckCurrentArrow(0)
		elif(Input.is_action_just_pressed("DownInput")):
			CheckCurrentArrow(1)
		elif(Input.is_action_just_pressed("LeftInput")):
			CheckCurrentArrow(2)
		elif(Input.is_action_just_pressed("RightInput")):
			CheckCurrentArrow(3)
		elif(Input.is_action_just_pressed("Throw")):
			throwing = true
		pass
	else:
		if(Input.is_action_just_released("Throw")):
			throwing = false
		armRef.rotation += rotationSwitch*delta
		if(rotationSwitch < 0 && armRef.rotation <= -PI/2):
			rotationSwitch = 1
		elif(rotationSwitch > 0 && armRef.rotation >= 0):
			rotationSwitch = -1

func ShuffleArrows():
	for arrow in arrows:
		arrow.shuffle()
	index = 0
		

func CheckCurrentArrow(value):
	if(arrows[index].direction == value):
		arrows[index].correct()
		index += 1
	else:
		arrows[index].failed()
		ShuffleArrows()
		
	if(index > 3):
		FinishedSequence()
		
func FinishedSequence():
	power += 1
	ShuffleArrows()
