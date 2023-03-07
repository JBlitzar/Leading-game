extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal BouyWin

func _ready():
	$AnimationPlayer.play("Finish Flash")
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(0, screenSize.x)
	var rndY = rng.randi_range(0, screenSize.y)
	position = Vector2(rndX, rndY)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Finish_body_entered(body):
	if body.get_collision_layer() == 32769:
		if body.has_passenger:
			emit_signal("BouyWin")
