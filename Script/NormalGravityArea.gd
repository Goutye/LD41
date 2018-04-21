extends Area2D

onready var player = preload("res://Script/Player.gd")

func _ready():
	pass

func get_gravity():
	return gravity_vec * gravity * 10

func _on_NormalGravityArea_body_entered(body):
	if body is player:
		body.gravity_areas.append(self)


func _on_NormalGravityArea_body_exited(body):
	if body is player:
		body.gravity_areas.erase(self)
