extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_die
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("playerdie", get_node("/root/MainMenu"), "playerdie")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func playerdie():
	print("DIE")


func _on_Finish_BouyWin():
	print("yay")
