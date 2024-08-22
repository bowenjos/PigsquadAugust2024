extends Node

var index: int = 0
var power: int = 0

@onready var arrows = [$BionicArm/InputArrow, $BionicArm/InputArrow2, $BionicArm/InputArrow3, $BionicArm/InputArrow4]

var throwing: bool = false
var thrown: bool = false

var armRef: Sprite2D

var armRoationSpeed: float = 5.0
var rotationSwitch: int = -1

signal try_launch(i_power: int, i_angle: float)

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	armRef = $ShotBot/ShotBotArm
	#armRef.process_mode = Node.PROCESS_MODE_DISABLED
	$ShotBotStanding.visible = false
	$Crouched.visible = true
	$ShotBot.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!throwing && !thrown):
		if(Input.is_action_just_pressed("UpInput")):
			CheckCurrentArrow(0)
		elif(Input.is_action_just_pressed("DownInput")):
			CheckCurrentArrow(1)
		elif(Input.is_action_just_pressed("LeftInput")):
			CheckCurrentArrow(2)
		elif(Input.is_action_just_pressed("RightInput")):
			CheckCurrentArrow(3)
		elif(Input.is_action_just_pressed("Throw")):
			$BionicArm.visible = false
			$ShotBotStanding.visible = true
			$Crouched.visible = false
			var timer = $Timer
			timer.start()
		pass
	elif(!thrown):
		if(Input.is_action_just_released("Throw")):
			throwing = false
			Throw()
		armRef.rotation += armRoationSpeed * rotationSwitch * delta
		if(rotationSwitch < 0 && armRef.rotation <= -PI/2):
			rotationSwitch = 1
		elif(rotationSwitch > 0 && armRef.rotation >= 0):
			rotationSwitch = -1



func Throw():
	thrown = true
	try_launch.emit(power, armRef.rotation)

func ShuffleArrows():
	var rng = RandomNumberGenerator.new()
	for arrow in arrows:
		var shuffle = rng.randi_range(0, 1)
		if(shuffle == 1):
			arrow.shuffle()
		else:
			arrow.reset()
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
	$CompletedSequence.DisplayGraphic()


func _on_timer_timeout():
	throwing = true
	$Crouched.visible = false
	$ShotBotStanding.visible = false
	$ShotBot.visible = true
	pass # Replace with function body.
