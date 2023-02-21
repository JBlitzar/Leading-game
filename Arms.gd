extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#anim debug
	$leftarm.modulate = Color(1, 1, 1)
	$rightarm.modulate = Color(1, 1, 1)
	$leftarm/AnimationPlayer.play("Left arm wave")
	$rightarm/AnimationPlayer.play("Right arm wave")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
