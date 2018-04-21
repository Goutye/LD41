extends Area2D

var exit_done = false
onready var player = preload("res://Script/Player.gd")

func _on_ExitArea_body_entered(body):
	if not exit_done and body is player:
		exit_done = true
		get_node("/root/global").next_scene()
