extends Node

enum BLOCKCOLOR{
	GRAY,
	WHITE,
	PURPLE,
	BLACK
}

var current_color = 0
var current_level = 0
var current_scene

var levels = ['res://Levels/Level1.tscn', 'res://Levels/Level2.tscn', 'res://Levels/Level3.tscn', 'res://Levels/Level4.tscn', 'res://Scene/MainStage.tscn']
var colors = [Color(0.2,0.2,0.2,1), Color(1,1,1,1), Color(0.568,0,0.753,1), Color(0,0,0,1)]

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )

func get_color(var x):
	return colors[x]

func next_scene():
	current_level = current_level + 1
	
	call_deferred("_deferred_goto_scene", levels[current_level])


func _deferred_goto_scene(path):

    # Immediately free the current scene,
    # there is no risk here.
    current_scene.free()

    # Load new scene
    var s = ResourceLoader.load(path)

    # Instance the new scene
    current_scene = s.instance()

    # Add it to the active scene, as child of root
    get_tree().get_root().add_child(current_scene)

    # optional, to make it compatible with the SceneTree.change_scene() API
    get_tree().set_current_scene( current_scene )