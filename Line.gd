extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var player
onready var playernode = get_node(player)
export(NodePath) var bouy
onready var bouynode = get_node(bouy)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
func _draw():
	draw_line( playernode.position, bouynode.position, 1)
