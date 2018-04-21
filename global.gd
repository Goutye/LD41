extends Node

enum BLOCKCOLOR{
	BLACK,
	WHITE	
}

var current_color = 0
var current_level = 0
var current_scene

var levels = ['res://Scene/MainStage.tscn', 'res://Scene/MainStage.tscn', 'res://Scene/MainStage.tscn', 'res://Scene/MainStage.tscn']

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )

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