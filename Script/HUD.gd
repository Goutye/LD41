extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var global = get_node("/root/global")
onready var flux = get_node("/root/flux")
onready var origin_cursor

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	origin_cursor = $Cursor.rect_position.x
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_color_1"):
		global.current_color = global.BLOCKCOLOR.BLACK
		flux.to($Cursor, 0.3, {ui_x = origin_cursor}, "absolute").ease('quad','out')
	elif Input.is_action_just_pressed("ui_color_2"):
		
		global.current_color = global.BLOCKCOLOR.WHITE
		flux.to($Cursor, 0.3, {ui_x = origin_cursor + 64}, "absolute").ease('quad','out')
		
	
