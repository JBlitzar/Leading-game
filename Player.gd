extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed:int = 200
export var distance_thresh:int = 50
var velocity: Vector2 = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)
func _physics_process(delta):
	get_input()
	var destination = position + velocity*delta
	if not get_global_mouse_position().distance_to(destination) < distance_thresh:
		velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
