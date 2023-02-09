extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal BouyWin
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("BouyWin", get_node("/root/Main/HumanManager"), "DismountHuman")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Finish_body_entered(body):
	if body.get_collision_layer() == 32769:
		if body.has_passenger:
			emit_signal("BouyWin")