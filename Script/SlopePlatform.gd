extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var color = Color(0,0,0,1)
var points = PoolVector2Array()
var line_points = PoolVector2Array()
var colors

func _ready():
	points.push_back(Vector2(-100, 25))
	points.push_back(Vector2(100, 25))
	points.push_back(Vector2(100, -25))
	colors = PoolColorArray([color])
	
	line_points.push_back(Vector2(-100, 25))
	line_points.push_back(Vector2(100, 25))
	line_points.push_back(Vector2(100, -25))
	line_points.push_back(Vector2(-100, 25))
	

func _process(delta):
	pass

func set_color(var new_color):
	color = new_color
	colors = PoolColorArray([color])
	update()

func _draw():
	draw_polygon(points, colors)
	draw_polyline(line_points, Color(0.5,0.5,0.5,1), 4.0)