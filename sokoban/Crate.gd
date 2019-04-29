extends KinematicBody2D

class_name Crate

onready var tween = $Tween

onready var sprite = $Sprite

var nb_placed = 0

func move(rel_vec):
	var other = move_and_collide(rel_vec,true,true,true)
	if other==null:
		tween.interpolate_property(self,"position",position,position+rel_vec,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		tween.start()
		return null
	return other

	
func set_placed(placed):
	if placed:
		nb_placed = nb_placed + 1
	else:
		nb_placed = nb_placed - 1

	if nb_placed>0:
		sprite.animation="brown_dark"
	else:
		sprite.animation="brown"