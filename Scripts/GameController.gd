extends Node

var shotPutSpeed: float = 0
var shotPutDistanceTraveled: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#$ShotPut.launch(Vector2(2400, -236000))
	$Music.play()
	$CanvasLayer/DistanceLabel.visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("Reset")):
		get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
	
	shotPutSpeed = $ShotPut.m_groundSpeed
	shotPutDistanceTraveled += shotPutSpeed*delta
	$CanvasLayer/DistanceLabel.text = str(snapped(shotPutDistanceTraveled, 0.01))
	$Player.speed = shotPutSpeed
	$Ground1.speed = shotPutSpeed
	$Ground2.speed = shotPutSpeed
	$Ground3.speed = shotPutSpeed
	$BackgroundHolder/Sky1_1.speed = shotPutSpeed
	$BackgroundHolder/Sky1_2.speed = shotPutSpeed
	$BackgroundHolder/Sky1_3.speed = shotPutSpeed
	$BackgroundHolder/Sky2_1.speed = shotPutSpeed
	$BackgroundHolder/Sky2_2.speed = shotPutSpeed
	$BackgroundHolder/Sky2_3.speed = shotPutSpeed
	$BackgroundHolder/Sky3_1.speed = shotPutSpeed
	$BackgroundHolder/Sky3_2.speed = shotPutSpeed
	$BackgroundHolder/Sky3_3.speed = shotPutSpeed
	$BackgroundHolder/Sky4_1.speed = shotPutSpeed
	$BackgroundHolder/Sky4_2.speed = shotPutSpeed
	$BackgroundHolder/Sky4_3.speed = shotPutSpeed
	$BackgroundHolder/Sky5_1.speed = shotPutSpeed
	$BackgroundHolder/Sky5_2.speed = shotPutSpeed
	$BackgroundHolder/Sky5_3.speed = shotPutSpeed
	$BackgroundHolder/Sky6_1.speed = shotPutSpeed
	$BackgroundHolder/Sky6_2.speed = shotPutSpeed
	$BackgroundHolder/Sky6_3.speed = shotPutSpeed
	$BackgroundHolder/Sky7_1.speed = shotPutSpeed
	$BackgroundHolder/Sky7_2.speed = shotPutSpeed
	$BackgroundHolder/Sky7_3.speed = shotPutSpeed
	$BackgroundHolder/Sky8_1.speed = shotPutSpeed
	$BackgroundHolder/Sky8_2.speed = shotPutSpeed
	$BackgroundHolder/Sky8_3.speed = shotPutSpeed
	$BackgroundHolder/Sky9_1.speed = shotPutSpeed
	$BackgroundHolder/Sky9_2.speed = shotPutSpeed
	$BackgroundHolder/Sky9_3.speed = shotPutSpeed
	$BackgroundHolder/Sky10_1.speed = shotPutSpeed
	$BackgroundHolder/Sky10_2.speed = shotPutSpeed
	$BackgroundHolder/Sky10_3.speed = shotPutSpeed
	$BackgroundHolder/Sky11_1.speed = shotPutSpeed
	$BackgroundHolder/Sky11_2.speed = shotPutSpeed
	$BackgroundHolder/Sky11_3.speed = shotPutSpeed
	$BackgroundHolder/Sky12_1.speed = shotPutSpeed
	$BackgroundHolder/Sky12_2.speed = shotPutSpeed
	$BackgroundHolder/Sky12_3.speed = shotPutSpeed
	$BackgroundHolder/Sky13_1.speed = shotPutSpeed
	$BackgroundHolder/Sky13_2.speed = shotPutSpeed
	$BackgroundHolder/Sky13_3.speed = shotPutSpeed
	$BackgroundHolder/Sky14_1.speed = shotPutSpeed
	$BackgroundHolder/Sky14_2.speed = shotPutSpeed
	$BackgroundHolder/Sky14_3.speed = shotPutSpeed
	$BackgroundHolder/Sky14_4.speed = shotPutSpeed
	$BackgroundHolder/Sky14_5.speed = shotPutSpeed
	$BackgroundHolder/Sky14_6.speed = shotPutSpeed
	$BackgroundHolder/Sky14_7.speed = shotPutSpeed
	$BackgroundHolder/Sky14_8.speed = shotPutSpeed
	$BackgroundHolder/Sky14_9.speed = shotPutSpeed
	$StartingZone.speed = shotPutSpeed
	pass

func _on_shot_put_stop_motion():
	$CanvasLayer/RestartLabel.visible = true


func _on_player_try_launch(i_power, i_angle):
	$Music.stop()
	$CanvasLayer/DistanceLabel.visible = true


func _on_player_run_out_of_time():
	$Music.stop()
	$CanvasLayer/DistanceLabel.visible = true
	$CanvasLayer/RestartLabel.visible = true
