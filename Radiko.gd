extends Node2D

var Kvadrato = preload("res://Karakteroj/Kvadrato.tscn")
onready var Karaktero = get_node("Kvadrato")
onready var Kamero = get_node("Kamero")
onready var Steloj_nombroj = get_node("Kanvaso/Steloj_nombroj")
onready var Steloj_nombroj_Sxangxi = get_node("Kanvaso/Steloj_nombroj/Sxangxi")
onready var Stelon_kapti_sono = get_node("Stelon_kapti_sono")
onready var Fonmuziko = get_node("Fonmuziko")
onready var Iri = get_node("Kanvaso/Kontroliloj/Iri")

func _ready():
	T.Radiko = self
	T.Karaktero = Karaktero
	Input.action_press("iri")
#	T.steloj = T.Agordejo.get_value("Elementoj", "steloj", 0)
	Steloj_nombroj.set_text(str(int(T.steloj)))
	set_process(true)
	set_process_input(true)

func _process(delta):
	Kamero.set_offset(Karaktero.get_global_pos()+Vector2(0,-100))

func _input(evento):
	if Input.is_key_pressed(KEY_M):
		if Iri.is_pressed():
			Iri.set_pressed(false)
			Input.action_release("iri")
		else:
			Iri.set_pressed(true)
			Input.action_press("iri")

func _on_Iri_toggled( b ):
	if b:
		Input.action_press("iri")
	else:
		Input.action_release("iri")

func _on_Pordego_body_enter( korpo ):
	if T.get_layer_bit(korpo,1):
		get_tree().reload_current_scene()
