extends Line2D
#Note to self: use the progressbar node in the future




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var playernode
onready var player = get_node(playernode)
export var offsets = [Vector2(0,0),Vector2(0,0)]
export (float) var health = 1.0
export (Color) var color1
export (Color) var color2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func colorlerp(c1,c2,p):
	return Color(
		c1.r*(1-p)+c2.r*p,
		c1.g*(1-p)+c2.g*p,
		c1.b*(1-p)+c2.b*p
	)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points = [player.position + offsets[0], player.position+offsets[1]-Vector2(1-health,0)*80]
	default_color = colorlerp(color2,color1,health)


func _on_Node_update_health_bar(newhealth):
	health = newhealth
