extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var platform
var color
var agents = []

export var can_click = true

onready var global = get_node("/root/global")
onready var player = preload("res://Script/Player.gd")

export(int, "GRAY", "WHITE", "PURPLE", "BLACK") var blockcolor = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	update_block(blockcolor)
	
func update_body_in():
	if blockcolor == global.BLOCKCOLOR.PURPLE:
		for body in agents:
			if body is player:
				body.gravity_dir = -body.gravity_dir
				print("inverse")
	
func update_block(var newblockcolor):
	blockcolor = newblockcolor
	$KinematicBody2D/Node2D.set_color(global.get_color(blockcolor))
	if blockcolor == global.BLOCKCOLOR.GRAY:
		$KinematicBody2D/CollisionPolygon2D.disabled = false
	elif blockcolor == global.BLOCKCOLOR.WHITE:
		$KinematicBody2D/CollisionPolygon2D.disabled = true
	elif blockcolor == global.BLOCKCOLOR.PURPLE:
		$KinematicBody2D/CollisionPolygon2D.disabled = true
		update_body_in()
	elif blockcolor == global.BLOCKCOLOR.BLACK:
		$KinematicBody2D/CollisionPolygon2D.disabled = false

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if can_click and event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			update_block(global.current_color)

func _on_Area2D_body_entered(body):
	agents.append(body)
	update_body_in()

func _on_Area2D_body_exited(body):
	agents.erase(body)
