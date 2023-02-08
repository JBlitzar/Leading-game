extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var playerpath
export (NodePath) var bouypath
onready var player = get_node(playerpath)
onready var bouy = get_node(bouypath)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points = [bouy.position, player.position]
