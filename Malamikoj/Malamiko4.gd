extends StaticBody2D

onready var Trancxi = get_node("Trancxi")

func _ready():
	Trancxi.interpolate_property(self, "transform/pos",
		get_global_pos(), get_global_pos()+Vector2(0,230), 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN
		)
	Trancxi.interpolate_property(self, "transform/pos",
		get_global_pos()+Vector2(0,230), get_global_pos(), 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN, 2
		)
	Trancxi.start()
