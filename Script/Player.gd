extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var GRAVITY_VEC = Vector2(0, 900)
var FLOOR_NORMAL = Vector2(0, -1)
var SLOPE_SLIDE_STOP = 25.0
const MIN_ONAIR_TIME = 0.1
var WALK_SPEED = 150 # pixels/sec

var linear_vel = Vector2()
var onair_time = 0 #
var on_floor = false
var direction = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	#increment counters

	onair_time += delta

	### MOVEMENT ###

	# Apply Gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and Slide
	var linear_velx = move_and_slide(Vector2(linear_vel.x, 0), FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	if is_on_wall():
		direction = -direction

	linear_vel = move_and_slide(Vector2(0, linear_vel.y), FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	linear_vel.x = linear_velx.x
	# Detect Floor
	if is_on_floor():
		onair_time = 0
		


	on_floor = onair_time < MIN_ONAIR_TIME

	### CONTROL ###

	# Horizontal Movement
	var target_speed = direction

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)	
	