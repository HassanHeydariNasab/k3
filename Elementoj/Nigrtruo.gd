extends Area2D

func _ready():
	pass

func _on_Nigrtruo_body_enter( korpo ):
	if T.get_layer_bit(korpo,1):
		get_tree().reload_current_scene()