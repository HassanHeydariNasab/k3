extends KinematicBody2D

onready var Ecoj = get_node("Ecoj")
onready var Fumo = get_node("Fumo")
onready var Ardo = get_node("Ardo")
onready var Aperi = get_node("Aperi")
onready var Ardi = get_node("Ardi")
onready var Aspekto_aktiva = get_node("Aspekto_aktiva")
onready var Aspekto_malaktiva = get_node("Aspekto_malaktiva")
onready var Sparko = get_node("/root/Radiko/Sparko")
onready var Sparko_sono = get_node("/root/Radiko/Sparko_sono")
onready var Trancxata = get_node("Trancxata")

const RAPIDO = 4
const RAPIDEGO = 10

var rapidega = false

var vivo = 10.0
const VIVO = 10.0

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
		rapidega = true
		T.Radiko.Fonmuziko.set_volume_db(5)
	else:
		rapidega = false
		T.Radiko.Fonmuziko.set_volume_db(-2)
	if Input.is_action_pressed("turni_dekstre"):
		rotate(deg2rad(-3))
	elif Input.is_action_pressed("turni_maldekstre"):
		rotate(deg2rad(3))

func _process(delta):
	if is_colliding():
		Sparko.set_global_pos(get_collision_pos())
		Sparko.set_rot(get_rot())
		Sparko.set_emitting(true)
		if not Sparko_sono.is_playing():
			Sparko_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	else:
		Sparko.set_emitting(false)
		Sparko_sono.stop()

func _on_Areo_area_enter( areo ):
	if T.get_layer_bit(areo, 2):
		if rapidega:
			areo.get_parent().Kasxi_sono.play()
			areo.get_parent().Kasxi.start()
		else:
			areo.get_parent().Bati.resume_all()
			areo.get_parent().Bati_sono.play()
			Trancxata.set_rot(get_rot())
			Trancxata.set_emitting(true)
			if vivo > 0:
				vivo -= 1
				Aspekto_aktiva.set_opacity(Aspekto_aktiva.get_opacity()*vivo/VIVO)

func _on_Areo_area_exit( areo ):
	Trancxata.set_emitting(false)