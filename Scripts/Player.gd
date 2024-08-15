extends Node

var index: int = 0

var arrows = [$InputArrow, $InputArrow2, $InputArrow3, $InputArrow4]

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("UpInput")):
		CheckCurrentArrow(0)
	elif(Input.is_action_just_pressed("DownInput")):
		CheckCurrentArrow(1)
	elif(Input.is_action_just_pressed("LeftInput")):
		CheckCurrentArrow(2)
	elif(Input.is_action_just_pressed("RightInput")):
		CheckCurrentArrow(3)
	elif(Input.is_action_just_pressed("Throw")):
		pass
	

func ShuffleArrows():
	for arrow in arrows:
		arrow.shuffle()
		

func CheckCurrentArrow(value):
	if(arrows[index].direction == value):
		arrows[index].success()
		index += 1
	else:
		arrows[index].failed()
