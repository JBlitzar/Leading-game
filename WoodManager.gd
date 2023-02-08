extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var wood
onready var screensize = get_viewport().get_visible_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WoodTimer_timeout():
	var woodInstance = wood.instance()
	woodInstance.position.y = randi() % int(round(screensize.y))
	var screenside = randi() % 2
	var xpos = screenside*screensize.y
	woodInstance.position.x = xpos
	var woodSpeed = randi() % 300 + 100
	woodInstance.velocity = Vector2((screenside*2-1)*woodSpeed,0)
