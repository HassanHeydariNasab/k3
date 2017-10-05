extends KinematicBody2D

onready var Kasxi = get_node("Kasxi")
onready var Bati = get_node("Bati")
onready var Bati_sono = get_node("Bati_sono")

func _ready():
	Kasxi.interpolate_property(self, "transform/scale",
		Vector2(1.5,1.5), Vector2(2.5,2.5), 0.4,
		Tween.TRANS_EXPO, Tween.EASE_IN
	)
	Kasxi.interpolate_property(self, "visibility/opacity",
		1, 0, 0.4,
		Tween.TRANS_EXPO, Tween.EASE_IN
	)
	Bati.interpolate_property(self, "transform/rot",
		0, 1400, 2,
		Tween.TRANS_QUAD, Tween.EASE_OUT
	)

func _on_Kasxi_tween_complete( object, key ):
	queue_free()

func _on_Bati_tween_step( object, key, elapsed, value ):
	if elapsed == 2:
		Bati.stop_all()

func _on_Bati_sono_finished():
	T.Radiko.Karaktero.Trancxata.set_emitting(false)
