extends Control

func _ready():
	get_tree().set_auto_accept_quit(false)

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")


func _on_Ludi_pressed():
	T.nivelo = 1
	get_tree().change_scene("res://Radiko.tscn")
