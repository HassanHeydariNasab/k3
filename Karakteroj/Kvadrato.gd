extends KinematicBody2D

onready var Ecoj = get_node("Ecoj")
onready var Fumo = get_node("Fumo")
onready var Aperi = get_node("Aperi")
onready var Aspekto_aktiva = get_node("Aspekto_aktiva")
onready var Aspekto_malaktiva = get_node("Aspekto_malaktiva")

const RAPIDO = 4
const RAPIDEGO = 10

func _ready():
	Aperi.interpolate_property(self, "transform/scale",
		Vector2(0.01,0.01), Vector2(1,1),0.3,
		Tween.TRANS_EXPO, Tween.EASE_IN
	)
	Aperi.start()
	set_fixed_process(true)

func _fixed_process(delta):
	move(Vector2(RAPIDO*cos(get_rot()), -RAPIDO*sin(get_rot())))
	if Input.is_action_pressed("rapidi") and T.steloj > 0:
		T.steloj -= 1
		T.Radiko.Steloj_nombroj.set_text(str(T.steloj))
		move(Vector2(RAPIDEGO*cos(get_rot()), -RAPIDEGO*sin(get_rot())))
#		Fumo.set("color/color","1E88E5EE")
#		if not Nitrogensono.is_playing():
#			Nitrogensono.set("stream/play", Tutmonda.Agordejo.get_value("Agordoj", "Sonoj", true))
	else:
#		Fumo.set("color/color","FFFFFFFF")
#		Nitrogensono.stop()
		pass
	if Input.is_action_pressed("turni_dekstre"):
		rotate(deg2rad(-3))
	elif Input.is_action_pressed("turni_maldekstre"):
		rotate(deg2rad(3))