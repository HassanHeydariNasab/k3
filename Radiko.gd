extends Node2D

var Kvadrato = preload("res://Karakteroj/Kvadrato.tscn")
onready var Karaktero = get_node("Kvadrato")
onready var Kamero = get_node("Kamero")
onready var Steloj_nombroj = get_node("Kanvaso/Steloj_nombroj")
onready var Steloj_nombroj_Sxangxi = get_node("Kanvaso/Steloj_nombroj/Sxangxi")
onready var Stelon_kapti_sono = get_node("Stelon_kapti_sono")

func _ready():
	T.Radiko = self
	T.Karaktero = Karaktero
	T.steloj = T.Agordejo.get_value("Elementoj", "steloj", 0)
	Steloj_nombroj.set_text(str(T.steloj))
	set_process(true)
	set_process_input(true)

func _process(delta):
	Kamero.set_offset(Karaktero.get_global_pos())

func _input(evento):
	if evento.is_action_pressed("kloni"):
		if Karaktero.Ecoj.TIPO == 4:
			Karaktero.set_fixed_process(false)
			Karaktero.Fumo.set_emitting(false)
			Karaktero.Aspekto_aktiva.hide()
			var K_ = Kvadrato.instance()
			K_.set_global_pos(Karaktero.get_global_pos()+Vector2(200*cos(Karaktero.get_rot()),200*-sin(Karaktero.get_rot())))
			K_.set_rot(Karaktero.get_rot())
			add_child(K_)
			Karaktero = K_