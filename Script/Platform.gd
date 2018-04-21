extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var color = Color(0,0,0,1)

func _ready():
	pass

func _process(delta):
	pass

func set_color(var new_color):
	color = new_color
	update()

func _draw():
	draw_rect(Rect2(-100, -25, 200, 50), color, true)
	draw_rect(Rect2(-100, -25, 200, 50), Color(0.5,0.5,0.5,1), false)