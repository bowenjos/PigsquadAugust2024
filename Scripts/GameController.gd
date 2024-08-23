extends Node

@onready var Counter = $CanvasLayer/Counter
@onready var remainingTimer = $RemainingTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	#$ShotPut.launch(Vector2(2400, -236000))
	$Music.play()
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Player.speed = $ShotPut.m_groundSpeed
	$Ground1.speed = $ShotPut.m_groundSpeed
	$Ground2.speed = $ShotPut.m_groundSpeed
	$Ground3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky1_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky1_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky1_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky2_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky2_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky2_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky3_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky3_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky3_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky4_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky4_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky4_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky5_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky5_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky5_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky6_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky6_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky6_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky7_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky7_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky7_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky8_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky8_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky8_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky9_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky9_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky9_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky10_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky10_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky10_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky11_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky11_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky11_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky12_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky12_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky12_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky13_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky13_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky13_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_1.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_2.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_3.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_4.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_5.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_6.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_7.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_8.speed = $ShotPut.m_groundSpeed
	$BackgroundHolder/Sky14_9.speed = $ShotPut.m_groundSpeed
	$StartingZone.speed = $ShotPut.m_groundSpeed
	pass

func _on_shot_put_stop_motion():
	pass # Replace with function body.


func _on_player_try_launch(i_power, i_angle):
	$Music.stop()
