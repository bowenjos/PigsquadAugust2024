extends Node2D


@onready var pig = $PigSprite

func _on_area_2d_area_entered(area):
	pig.Roll()


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pig.Roll()


func _on_area_2d_body_entered(body):
	pig.Roll()
