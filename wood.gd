extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity: Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var scalexy = randi() % 4 + 1
	scale = Vector2(scalexy,scalexy)
	rotation = ((randi() % 100)/100)*2*3.14
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = move_and_slide(velocity)
	print(position)
