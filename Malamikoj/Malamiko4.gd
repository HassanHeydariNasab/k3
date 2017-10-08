extends Node2D

onready var Korpo = get_node("Korpo")
onready var Trancxi = get_node("Trancxi")

func _ready():
	randomize()
	var t = rand_range(0,2)
	Trancxi.interpolate_property(Korpo, "transform/pos",
		Korpo.get_pos(), Korpo.get_pos()+Vector2(0,230), 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN,t
		)
	Trancxi.interpolate_property(Korpo, "transform/pos",
		Korpo.get_pos()+Vector2(0,230), Korpo.get_pos(), 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN, t+2
		)
	Trancxi.start()
