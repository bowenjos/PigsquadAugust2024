extends Node

var index: int = 0
var power: int = 1

var m_chargeTime: float = 1

var m_coyoteTime: float = 0.5

@onready var shotBotRef = $ShotBot
@onready var shotBotFallRef = $ShotBotFall
var move: bool = 0
var speed: float = 0

@onready var timer = $Timer
@onready var arrows = [$BionicArm/InputArrow, $BionicArm/InputArrow2, $BionicArm/InputArrow3, $BionicArm/InputArrow4]

@onready var chargingMeterRef = $ChargingMeter

@onready var Audio = $AudioStreamPlayer2D
@onready var FailSFX = load("res://Sounds/pipe.mp3")

var canThrow: bool = true
var throwing: bool = false
var charged: bool = false
var thrown: bool = false

@onready var armRef: Sprite2D = $ShotBot/ShotBotArm
@onready var armThrownRef: Sprite2D = $ShotBot/ShotBotArmThrow

var armRoationSpeed: float = 5.0
var rotationSwitch: int = -1

signal try_launch(i_power: int, i_angle: float)
signal run_out_of_time()

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	#armRef.process_mode = Node.PROCESS_MODE_DISABLED
	$ShotBotStanding.visible = false
	$Crouched.visible = true
	$ShotBot.visible = false
	$ShotBotFall.visible = false
	$ShotBotFacepalm.visible = false
	$RemainingTimer.start(30)
	$ChargingMeter.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($RemainingTimer.get_time_left() > 10):
		$CanvasLayer2/TimerLabel.text = str(snapped($RemainingTimer.get_time_left(), 0.1))
	else:
		$CanvasLayer2/TimerLabel.text = str(snapped($RemainingTimer.get_time_left(), 0.01))
	
	if(!charged && timer.time_left > 0):
		chargingMeterRef.Update(m_chargeTime - timer.time_left)
	elif(charged):
		chargingMeterRef.Update(1)
	
	shotBotRef.position.x -= speed*delta
	shotBotFallRef.position.x -= speed*delta
	if(shotBotRef.position.x < -1000):
		shotBotRef.process_mode = Node.PROCESS_MODE_DISABLED
		shotBotFallRef.process_mode = Node.PROCESS_MODE_DISABLED
	if(canThrow):
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
				$CanvasLayer2/Label2.text = "Release to throw"
				$CanvasLayer2/Label.visible = false
				$BionicArm.visible = false
				$ShotBotStanding.visible = true
				$Crouched.visible = false
				chargingMeterRef.visible = true
				timer.start(m_chargeTime)
			elif(!charged && Input.is_action_just_released("Throw")):
				throwing = false
				power = 1
				timer.stop()
				
				$BionicArm.visible = false
				$ShotBotStanding.visible = false
				$Crouched.visible = false
				$ShotBotFall.visible = true
				$CanvasLayer2/Label2.visible = false
				
				armRef.rotation = -PI/4
				
				chargingMeterRef.visible = false
				Audio.stream = FailSFX
				Audio.play()
				$CanvasLayer2/TimerLabel.visible = false
				Throw()
			pass
		elif(!thrown):
			if(Input.is_action_just_released("Throw")):
				throwing = false
				$CanvasLayer2/Label2.visible = false
				chargingMeterRef.visible = false
				armRef.visible = false
				armThrownRef.rotation = armRef.rotation
				armThrownRef.visible = true
				$CanvasLayer2/TimerLabel.visible = false
				Throw()
			armRef.rotation += armRoationSpeed * rotationSwitch * delta
			if(rotationSwitch < 0 && armRef.rotation <= -PI/2):
				rotationSwitch = 1
			elif(rotationSwitch > 0 && armRef.rotation >= 0):
				rotationSwitch = -1



func Throw():
	thrown = true
	try_launch.emit(power, armRef.rotation)
	speed = -cos(armRef.rotation)*power*200
	move = true
	$RemainingTimer.stop()
	


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
	$Crouched/Node2D.emitting = true
	$Crouched/Node2D.amount = power*power
	$Crouched/Node2D.lifetime = float(power)*.03
	ShuffleArrows()
	$CompletedSequence.DisplayGraphic()


func _on_timer_timeout():
	throwing = true
	$Crouched.visible = false
	$ShotBotStanding.visible = false
	$ShotBot.visible = true
	charged = true
	pass # Replace with function body.


func _on_remaining_timer_timeout():
	if(!thrown):
		$RemainingCoyoteTimer.start(m_coyoteTime)
		
	pass # Replace with function body.


func _on_remaining_coyote_timer_timeout():
	if(!thrown):
		canThrow = false
		
		timer.stop()
		run_out_of_time.emit()
		
		$CanvasLayer2.visible = false
		$BionicArm.visible = false
		$ShotBotFacepalm.visible = true
		$ShotBotStanding.visible = false
		$Crouched.visible = false
		$ShotBot.visible = false
		$ShotBotFall.visible = false
		
		chargingMeterRef.visible = false
		
		Audio.stream = FailSFX
		Audio.play()
	pass # Replace with function body.
