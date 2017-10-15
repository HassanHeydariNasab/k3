extends Area2D

onready var Rotacii = get_node("Rotacii")
onready var Aspekto = get_node("Aspekto")
onready var Aspekto_cirklo = get_node("Aspekto_cirklo")

func _ready():
	Rotacii.interpolate_property(Aspekto, "transform/rot",
		0, 360, 2, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	Rotacii.interpolate_property(Aspekto_cirklo, "transform/rot",
		360, 0, 2, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	Rotacii.start()

func _on_Nigrtruo_body_enter( korpo ):
	get_tree().reload_current_scene()

func _on_Sono_body_enter( korpo ):
	pass
