extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var platform
var color
onready var global = get_node("/root/global")

export(int, "BLACK", "WHITE") var blockcolor = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	update_block(blockcolor)
	
func update_block(var newblockcolor):
	blockcolor = newblockcolor
	if blockcolor == global.BLOCKCOLOR.BLACK:
		$KinematicBody2D/CollisionPolygon2D.disabled = false
		$KinematicBody2D/Node2D.set_color(Color(0,0,0,1))
	elif blockcolor == global.BLOCKCOLOR.WHITE:
		$KinematicBody2D/CollisionPolygon2D.disabled = true
		$KinematicBody2D/Node2D.set_color(Color(1,1,1,1))

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			update_block(global.current_color)
