extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var playernode;
onready var player = get_node(playernode)
export (Vector2) var offset = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position + offset.rotated(player.rotation)
