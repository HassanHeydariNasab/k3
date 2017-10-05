extends KinematicBody2D

onready var Bati = get_node("Bati")
onready var Bati_sono = get_node("Bati_sono")

func _ready():
	Bati.interpolate_property(self, "transform/rot",
		0, 1400, 2,
		Tween.TRANS_QUAD, Tween.EASE_OUT
	)

func _on_Bati_tween_step( object, key, elapsed, value ):
	if elapsed == 2:
		Bati.stop_all()

func _on_Bati_sono_finished():
	T.Radiko.Karaktero.Trancxata.set_emitting(false)
