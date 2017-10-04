extends KinematicBody2D

onready var Ecoj = get_node("Ecoj")
onready var Fumo = get_node("Fumo")
onready var Ardo = get_node("Ardo")
onready var Aperi = get_node("Aperi")
onready var Ardi = get_node("Ardi")
onready var Aspekto_aktiva = get_node("Aspekto_aktiva")
onready var Aspekto_malaktiva = get_node("Aspekto_malaktiva")
onready var Sparko = get_node("/root/Radiko/Sparko")

const RAPIDO = 4
const RAPIDEGO = 10

func _ready():
	Aperi.interpolate_property(self, "transform/scale",
		Vector2(0.01,0.01), Vector2(1,1),0.4,
		Tween.TRANS_EXPO, Tween.EASE_IN
	)
	Aperi.start()
	Ardi.interpolate_property(Ardo, "visibility/opacity",
		1,0.2,0.3,Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	Ardi.interpolate_property(Ardo, "visibility/opacity",
		0.2,1,0.5,Tween.TRANS_LINEAR, Tween.EASE_OUT,0.5
	)
	Ardi.start()
	set_fixed_process(true)
	set_process(true)

func _fixed_process(delta):
	move(Vector2(RAPIDO*cos(get_rot()), -RAPIDO*sin(get_rot())))
	if Input.is_action_pressed("rapidi") and T.steloj > 0:
		T.steloj -= 0.04
		T.Radiko.Steloj_nombroj.set_text(str(int(T.steloj)))
		move(Vector2(RAPIDEGO*cos(get_rot()), -RAPIDEGO*sin(get_rot())))
	if Input.is_action_pressed("turni_dekstre"):
		rotate(deg2rad(-3))
	elif Input.is_action_pressed("turni_maldekstre"):
		rotate(deg2rad(3))

func _process(delta):
	if is_colliding():
		Sparko.set_global_pos(get_collision_pos())
		Sparko.set_rot(get_rot())
		Sparko.set_emitting(true)
#		if not Sparko_Sono.is_playing():
#			Sparko_Sono.set("stream/play", Tutmonda.Agordejo.get_value("Agordoj", "Sonoj", true))
	else:
		Sparko.set_emitting(false)
#		Sparko_Sono.stop()