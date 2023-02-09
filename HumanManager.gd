extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var humanScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func DismountHuman():
	for child in $HumanPit.get_children():
		if child.mounted:
			child.dismount()
			child.call_deferred("queue_free")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HumanTimer_timeout():
	var instance = humanScene.instance()
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(0, screenSize.x)
	var rndY = rng.randi_range(0, screenSize.y)
	instance.position = Vector2(rndX, rndY)
	$HumanPit.add_child(instance)
	
